def auto_egp():

    from urllib.request import urlopen
    from urllib.error import URLError, HTTPError
    import xml.etree.ElementTree as ET
    import os
    import pandas as pd
    from datetime import datetime
    from tqdm.auto import tqdm
    import mysql.connector

    today = datetime.now().strftime('%d%m%Y')
    tomonth = datetime.now().strftime('%B')
    toyear = datetime.now().strftime('%Y')

    path_location = 'EGP/' + toyear + '/' + tomonth

    file_csv = path_location + '/' + today + '.csv'

    url = 'http://process3.gprocurement.go.th/EPROCRssFeedWeb/egpannouncerss.xml'
    parameter_deptId = '?deptId='
    parameter_anounceType = '&anounceType='

    from configparser import ConfigParser

    #Read config.ini file
    config_object = ConfigParser()
    config_object.read("config.ini")

    mariadb_info = config_object["DB_MariaDB"]
    username = mariadb_info["username"]
    passwd = mariadb_info["passwd"]
    hostname = mariadb_info["hostname"]
    port = mariadb_info["port"]
    db = mariadb_info["database"]

    conn = mysql.connector.connect(
        host=hostname,
        user=username,
        password=passwd,
        database=db,
        port=port
    )

    # sql = "SELECT numID FROM EGP_ID"
    sql = "SELECT numid FROM `egp_id`"      # mariadb
    cursor = conn.cursor()
    cursor.execute(sql)

    data = cursor.fetchall()
    # print(data)
    deptId_ = []
    for i in data:
        # print(i)
        for _i in i:
            deptId_.append(str(_i))
            
    cursor.close()
    conn.close()

    anounceType_ = ['W0', 'W2', 'B0', 'D0', 'D1', 'D2', 'P0', 'W1', '15']

    if os.path.isdir(path_location) == False:
        os.makedirs(path_location)

    list_data = {
        'title': [],
        'link': [],
        'pubDate': [],
        'numID': [],
        'pubT': [],
        'pubD': [],
        'pubM': [],
        'pubY': []
    }

    for anounceType in anounceType_:
        for deptId in tqdm(deptId_, desc=f'Pull e-GP {anounceType}', colour='GREEN', ncols=100):
            url_str = url + parameter_deptId + deptId + parameter_anounceType + anounceType
            # print(url_str)
            try:
                
                res = urlopen(url_str)

                try:
                    
                    tree = ET.parse(res).getroot()

                    # get data
                    for root in tree.findall('./channel/item'):
                        if root.tag == 'item':
                            list_data['numID'].append(deptId)

                            if anounceType == 'W0':
                                list_data['pubT'].append(1)
                            elif anounceType == 'D1':
                                list_data['pubT'].append(2)
                            elif anounceType == 'P0':
                                list_data['pubT'].append(3)
                            elif anounceType == '15':
                                list_data['pubT'].append(4)
                            elif anounceType == 'D0':
                                list_data['pubT'].append(5)
                            elif anounceType == 'W1':
                                list_data['pubT'].append(6)
                            elif anounceType == 'D2':
                                list_data['pubT'].append(7)
                            elif anounceType == 'W2':
                                list_data['pubT'].append(8)
                            else:       # B0
                                list_data['pubT'].append(9)

                            for rss in root:
                                # print(rss.tag)
                                if rss.tag == 'description' or rss.tag == 'guid':
                                    pass
                                else:
                                    if rss.tag == 'pubDate':
                                        list_data[rss.tag].append(rss.text)
                                        pubDate_str = datetime.strptime(rss.text, '%Y-%m-%d').date()
                                        list_data['pubD'].append(pubDate_str.strftime('%d'))
                                        list_data['pubM'].append(pubDate_str.strftime('%m'))
                                        list_data['pubY'].append(pubDate_str.strftime('%Y'))
                                    else:
                                        list_data[rss.tag].append(rss.text)
                        else:
                            print('Not ITEM')

                except ET.ParseError as err:
                    print(err)
            except (URLError, HTTPError, ConnectionError) as err:
                print(err)
    
    # print(list_data)
    # print(len(list_data['title']), len(list_data['link']), len(list_data['numID']), len(list_data['pubD']), len(list_data['pubM']), len(list_data['pubT']), len(list_data['pubY']), len(list_data['pubDate']))

    df = pd.DataFrame(list_data)

    # .csv ภาษาไทย เอ่อออ

    if os.path.isfile(file_csv) == False:
        df.to_csv(file_csv, index=False, mode='a')



def upload_mariadb():

    import mysql.connector
    import pandas as pd
    from datetime import datetime
    import os
    from tqdm.auto import tqdm

    from configparser import ConfigParser
    config_object = ConfigParser()
    config_object.read("config.ini")

    mariadb_info = config_object["DB_MariaDB"]
    username = mariadb_info["username"]
    passwd = mariadb_info["passwd"]
    hostname = mariadb_info["hostname"]
    port = mariadb_info["port"]
    db = mariadb_info["database"]

    conn = mysql.connector.connect(
        host=hostname,
        user=username,
        password=passwd,
        database=db,
        port=port
    )

    today = datetime.now().strftime('%d%m%Y')
    tomonth = datetime.now().strftime('%B')
    toyear = datetime.now().strftime('%Y')

    path_location = 'EGP/' + toyear + '/' + tomonth

    file_csv = path_location + '/' + today + '.csv'

    if os.path.isfile(file_csv) == True:
        df = pd.read_csv(file_csv)
        # print(df)

        def check_duplicate(link_):
            sql = "SELECT `egpid` FROM `egp` WHERE link='" + link_ + "'"
            cursor = conn.cursor()
            cursor.execute(sql)
            data = cursor.fetchone()
            cursor.close()
            return data

        # print(check_duplicate("http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=65087489973&templateType=W2&temp_Announ=A&temp_itemNo=0&seqNo=1"))

        for i in tqdm(range(len(df['link'])), desc='Processing', colour='GREEN', ncols=100):
            # print(df['link'][i])
            # print(check_duplicate(df['link'][i]))
            if check_duplicate(df['link'][i]) == None:
                sql = "INSERT INTO `egp`(`title`, `link`, `pubDate`, `numID`, `pubT`, `pubD`, `pubM`, `pubY`) VALUES ('" + str(df['title'][i]) + "','" + str(df['link'][i]) + "','" + str(df['pubDate'][i]) + "','" + str(df['numID'][i]) + "','" + str(df['pubT'][i]) + "','" + str(df['pubD'][i]) + "','" + str(df['pubM'][i]) + "','" + str(df['pubY'][i]) + "')"
                # print(sql)
                cursor = conn.cursor()
                cursor.execute(sql)
                conn.commit()
                cursor.close()
            # else:
            #     print("Duplicate")
            
    else:
        print('No Directory')

    conn.close()





print("""

                            AutoEGP By Avatart0Dev :)

""")


def runall():
    auto_egp()
    upload_mariadb()


def time_in_range(start, end, x):
    """Return true if x is in the range [start, end]"""
    if start <= end:
        return start <= x <= end
    else:
        return start <= x or x <= end

if __name__ == '__main__':

    from datetime import datetime

    time_now = str(datetime.now().strftime('%H:%M'))
    # print(time_now)

    if time_in_range('17:01','08:59',time_now) or time_in_range('12:01','12:59',time_now):
        print('''
        E-GP Systems. Status: ONLINE
        ''')
        from time import time
        start = time()
        runall()
        end = time()
        print('Succeed to Complete.!', end-start)
    else:
        print('''
        E-GP Systems. Status: OFFLINE
        ''')
