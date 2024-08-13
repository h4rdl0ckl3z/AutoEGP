class connect_db:
    def __init__(self):
        self.config_db()
        self.connect()
    
    def config_db(self):
        from configparser import ConfigParser

        config_object = ConfigParser()
        config_object.read("config.ini")

        mariadb_info = config_object["DB_MariaDB"]
        self.username = mariadb_info["username"]
        self.passwd = mariadb_info["passwd"]
        self.hostname = mariadb_info["hostname"]
        self.port = mariadb_info["port"]
        self.database = mariadb_info["database"]
    
    def connect(self):
        import mysql.connector
        self.condb = mysql.connector.connect(
            host=self.hostname,
            user=self.username,
            password=self.passwd,
            database=self.database,
            port=self.port
        )

class auto_egp:
    def __init__(self):
        self.egpid()
        self.egp()
        self.upload()
        self.reset_id()
        self.backup()
    
    def egpid(self):
        conn = connect_db().condb
        sql = "SELECT numid FROM `egp_id`"
        cursor = conn.cursor()
        cursor.execute(sql)
        data = cursor.fetchall()
        self.deptId_ = []
        for i in data:
            for j in i:
                self.deptId_.append(str(j))
                
        cursor.close()
        conn.close()

    def egp(self):
        from urllib.request import urlopen
        from urllib.error import URLError, HTTPError
        import xml.etree.ElementTree as ET

        url = 'http://process3.gprocurement.go.th/EPROCRssFeedWeb/egpannouncerss.xml'
        parameter_deptId = '?deptId='
        parameter_anounceType = '&anounceType='

        anounceType_ = ['W0', 'W2', 'B0', 'D0', 'D1', 'D2', 'P0', 'W1', '15']

        self.list_data = {
            'title': [],
            'link': [],
            'pubDate': [],
            'numID': [],
            'pubT': []
        }

        for anounceType in anounceType_:
            for deptId in self.deptId_:
                url_str = url + parameter_deptId + deptId + parameter_anounceType + anounceType
            try:
                res = urlopen(url_str)
                try:
                    tree = ET.parse(res).getroot()
                    for root in tree.findall('./channel/item'):
                        if root.tag == 'item':
                            self.list_data['numID'].append(deptId)

                            if anounceType == 'W0':
                                self.list_data['pubT'].append(1)
                            elif anounceType == 'D1':
                                self.list_data['pubT'].append(2)
                            elif anounceType == 'P0':
                                self.list_data['pubT'].append(3)
                            elif anounceType == '15':
                                self.list_data['pubT'].append(4)
                            elif anounceType == 'D0':
                                self.list_data['pubT'].append(5)
                            elif anounceType == 'W1':
                                self.list_data['pubT'].append(6)
                            elif anounceType == 'D2':
                                self.list_data['pubT'].append(7)
                            elif anounceType == 'W2':
                                self.list_data['pubT'].append(8)
                            else:       # B0
                                self.list_data['pubT'].append(9)

                            for rss in root:
                                if rss.tag == 'description' or rss.tag == 'guid':
                                    pass
                                else:
                                    self.list_data[rss.tag].append(rss.text)
                        else:
                            print('No ITEMS')

                except ET.ParseError as err:
                    print(err)
            except (URLError, HTTPError, ConnectionError) as err:
                print(err)
            
    def upload(self):
        conn = connect_db().condb
        for i in range(len(self.list_data['link'])):
            sql = "INSERT INTO `egp`(`title`, `link`, `pubDate`, `numID`, `pubT`) VALUES ('" + str(self.list_data['title'][i]) + "','" + str(self.list_data['link'][i]) + "','" + str(self.list_data['pubDate'][i]) + "','" + str(self.list_data['numID'][i]) + "','" + str(self.list_data['pubT'][i]) + "') ON DUPLICATE KEY UPDATE `title` = '" + str(self.list_data['title'][i]) + "'" 
            cursor = conn.cursor()
            cursor.execute(sql)
            conn.commit()
            cursor.close()

    def reset_id(self):
        conn = connect_db().condb
        sql = "ALTER TABLE `egp` AUTO_INCREMENT = 1"
        cursor = conn.cursor()
        cursor.execute(sql)
        conn.commit()
        cursor.close()
        conn.close()

    def backup(self):
        from datetime import datetime
        today = datetime.now().strftime('%d%m%Y')
        tomonth = datetime.now().strftime('%B')
        toyear = datetime.now().strftime('%Y')

        path_location = 'EGP/' + toyear + '/' + tomonth

        file_csv = path_location + '/' + today + '.csv'

        import pandas as pd

        df = pd.DataFrame(self.list_data)

        from os.path import isfile, isdir
        from os import makedirs
        if isdir(path_location) == False:
            makedirs(path_location)
            if isfile(file_csv) == False:
                df.to_csv(file_csv, index=False, mode='a')

if __name__ == '__main__':
    auto_egp()
