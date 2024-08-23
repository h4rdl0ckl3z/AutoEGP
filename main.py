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
        self.backup()
        self.upload()
        self.reset_id()
    
    def egpid(self):
        conn = connect_db().condb
        sql = "SELECT numid FROM `customers`"
        cursor = conn.cursor()
        cursor.execute(sql)
        data = cursor.fetchall()
        self.dept_ids = []
        for i in data:
            for j in i:
                self.dept_ids.append(str(j))
                
        cursor.close()
        conn.close()

    def egp(self):
        from urllib.request import urlopen
        from urllib.error import URLError, HTTPError
        import xml.etree.ElementTree as ET
        from datetime import datetime

        base_url = 'http://process3.gprocurement.go.th/EPROCRssFeedWeb/egpannouncerss.xml'
        anounce_types = ['W0', 'W2', 'B0', 'D0', 'D1', 'D2', 'P0', 'W1', '15']

        announce_type_mapping = {
            'W0': 1,
            'D1': 2,
            'P0': 3,
            '15': 4,
            'D0': 5,
            'W1': 6,
            'D2': 7,
            'W2': 8,
            'B0': 9
        }

        self.list_data = {
            'title': [],
            'link': [],
            'pubDate': [],
            'anounceType': [],
            'numID': []
        }

        try:
            for anounce_type in anounce_types:
                for dept_id in self.dept_ids:
                    url = f"{base_url}?deptId={dept_id}&anounceType={anounce_type}"
                    res = urlopen(url)
                    tree = ET.parse(source=res, parser=ET.XMLParser(encoding='cp874')).getroot()
                    for root in tree.findall('./channel/item'):
                        self.list_data['numID'].append(dept_id)
                        self.list_data['pubT'].append(announce_type_mapping[anounce_type])
                        for rss in root:
                            if rss.tag not in ('description', 'guid'):
                                self.list_data[rss.tag].append(rss.text)
        except (URLError, HTTPError, ConnectionError) as err:
            print(f"Error fetching data: {err}")
            
    def upload(self):
        conn = connect_db().condb
        for i in range(len(self.list_data['link'])):
            sql = "INSERT INTO `egps`(`title`, `link`, `pubDate`, `numID`, `pubT`) VALUES ('" + str(self.list_data['title'][i]) + "','" + str(self.list_data['link'][i]) + "','" + str(self.list_data['pubDate'][i]) + "','" + str(self.list_data['numID'][i]) + "','" + str(self.list_data['pubT'][i]) + "') ON DUPLICATE KEY UPDATE `link` = '" + str(self.list_data['link'][i]) + "'" 
            cursor = conn.cursor()
            cursor.execute(sql)
            conn.commit()
            cursor.close()

    def reset_id(self):
        conn = connect_db().condb
        sql = "ALTER TABLE `egps` AUTO_INCREMENT = 1"
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
    from time import time
    start = time()
    auto_egp()
    end = time()
    print('Succeed to Complete.!', end-start)
