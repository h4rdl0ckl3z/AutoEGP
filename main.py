def auto_egp():

    from urllib.request import urlopen
    import xml.etree.ElementTree as ET
    import os
    import pandas as pd
    from datetime import datetime

    today = datetime.now().strftime('%d%m%Y')
    tomonth = datetime.now().strftime('%B')
    toyear = datetime.now().strftime('%Y')
    today_d = datetime.now().strftime('%d')
    tomonth_m = datetime.now().strftime('%m')

    path_location = 'EGP/' + toyear + '/' + tomonth

    file_csv = path_location + '/' + today + '.csv'

    url = 'http://process3.gprocurement.go.th/EPROCRssFeedWeb/egpannouncerss.xml'
    parameter_deptId = '?deptId='
    parameter_anounceType = '&anounceType='

    from configparser import ConfigParser

    #Read config.ini file
    config_object = ConfigParser()
    config_object.read("config.ini")

    access_info = config_object["DB_Access"]
    username = access_info["username"]
    passwd = access_info["passwd"]
    access_path = access_info["database_path"]

    import sqlalchemy as sa
    driver = "{Microsoft Access Driver (*.mdb, *.accdb)}"

    connection_string = (
        f"DRIVER={driver};"
        f"DBQ={access_path};"
        f"PWD={passwd};"
        f"ExtendedAnsiSQL=1;"
    )
    connection_url = sa.engine.URL.create(
        "access+pyodbc",
        username=username,
        password=passwd,
        query={"odbc_connect": connection_string}
    )
    engine = sa.create_engine(connection_url)
    sql = "SELECT numID FROM EGP_ID"
    data = engine.connect().execute(sql).fetchall()
    # print(data)
    deptId_ = []
    for i in data:
        # print(i)
        for _i in i:
            deptId_.append(str(_i))

    anounceType_ = ['W0', '15', 'B0', 'D0', 'D1', 'D2', 'P0', 'W1', 'W2']

    if os.path.isdir(path_location) == False:
        os.makedirs(path_location)

    list_test = {}

    for deptId in deptId_:
        for anounceType in anounceType_:
            url_str = url + parameter_deptId + deptId + parameter_anounceType + anounceType

            url_open = urlopen(url_str)

            root = ET.parse(url_open).getroot()

            # get title
            for rss in root:
                for channel in rss:
                    if channel.tag == 'item':
                        # print(channel.tag)
                        for item in channel:
                            if item.tag == 'description' or item.tag == 'guid':
                                pass
                            else:
                                list_test.update({
                                    item.tag: []
                                })
                        list_test.update({
                            'numID': [],
                            'pubT': [],
                            'pubD': [],
                            'pubM': [],
                            'pubY': []
                        })

            # get data
            for rss in root:
                for channel in rss:
                    if channel.tag == 'item':
                        # print(channel.tag)
                        for item in channel:
                            # print(item.tag)
                            if item.tag == 'description' or item.tag == 'guid':
                                pass
                            else:
                                # print(item.text)
                                list_test[item.tag].append(item.text)
                        list_test['numID'].append(deptId)
                        if anounceType == 'W0':
                            list_test['pubT'].append(1)
                        elif anounceType == 'D1':
                            list_test['pubT'].append(2)
                        elif anounceType == 'P0':
                            list_test['pubT'].append(3)
                        elif anounceType == '15':
                            list_test['pubT'].append(4)
                        elif anounceType == 'D0':
                            list_test['pubT'].append(5)
                        elif anounceType == 'W1':
                            list_test['pubT'].append(6)
                        elif anounceType == 'D2':
                            list_test['pubT'].append(7)
                        elif anounceType == 'W2':
                            list_test['pubT'].append(8)
                        else:       # B0
                            list_test['pubT'].append(9)
                        list_test['pubD'].append(today_d)
                        list_test['pubM'].append(tomonth_m)
                        list_test['pubY'].append(toyear)

            # print(list_test)

            if list_test != {}:

                df = pd.DataFrame(list_test)

                # .csv ภาษาไทย เอ่อออ

                if os.path.isfile(file_csv) == True:
                    df.to_csv(file_csv, index=False, mode='a', header=False)
                else:
                    df.to_csv(file_csv, index=False)



def data_duplicate():

    import pandas as pd
    from datetime import datetime
    import os

    today = datetime.now().strftime('%d%m%Y')
    tomonth = datetime.now().strftime('%B')
    toyear = datetime.now().strftime('%Y')

    path_location = 'EGP/' + toyear+ '/' + tomonth

    file_csv = path_location + '/' + today + '.csv'

    # ตัดข้อมูลซ้ำ
    if os.path.isfile(file_csv) == True:
        df = pd.read_csv(file_csv)
        df.drop_duplicates(inplace=True)
        # print(df)
        df.to_csv(file_csv, index=False)
    else:
        print('No Directory')



def upload_mariadb():

    from sqlalchemy import create_engine
    import pandas as pd
    from datetime import datetime
    import os

    from configparser import ConfigParser
    config_object = ConfigParser()
    config_object.read("config.ini")

    mariadb_info = config_object["DB_MariaDB"]
    username = mariadb_info["username"]
    passwd = mariadb_info["passwd"]
    hostname = mariadb_info["hostname"]
    port = mariadb_info["port"]
    db = mariadb_info["database"]

    today = datetime.now().strftime('%d%m%Y')
    tomonth = datetime.now().strftime('%B')
    toyear = datetime.now().strftime('%Y')

    path_location = 'EGP/' + toyear + '/' + tomonth

    file_csv = path_location + '/' + today + '.csv'

    if os.path.isfile(file_csv) == True:
        df = pd.read_csv(file_csv)
        # print(df)

        engine = create_engine('mysql+pymysql://' + username + ':' + passwd + '@' + hostname + ':' + port + '/' + db + '')
        engine.connect()
        # link_ = "'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=65087489973&templateType=W2&temp_Announ=A&temp_itemNo=0&seqNo=1'"

        # title_ = 'จ้างซ่อมแซมถนนคอนกรีตเสริมเหล็กภายในหมู่บ้าน หมู่ที่ 4 บ้านนาสองเหมือง ตำบลนากอก อำเอนิคมคำสร้อย จังหวัดมุกดาหาร โดยวิธีเฉพาะเจาะจง'
        # sql = 'SELECT `title`, `link`, `pubDate`, `numID`, `pubT`, `pubD`, `pubM`, `pubY` FROM `egp` WHERE link=' + link_

        # test = engine.connect().execute(sql).fetchall()
        # print(test)

        """"Complate!! Kuy MariaDB"""

        def loopcheck(link_):
            sql = "SELECT * FROM egp WHERE link='" + link_ + "'"
            data = engine.connect().execute(sql).fetchall()
            return data

        # print(loopcheck("http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=65087489973&templateType=W2&temp_Announ=A&temp_itemNo=0&seqNo=1"))

        for i in range(len(df['link'])):
            # print(loopcheck(i))
            if loopcheck(df['link'][i]) == []:
                # print("INSERT")
                # print(df['link'][i])
                sql = "INSERT INTO `egp`(`title`, `link`, `pubDate`, `numID`, `pubT`, `pubD`, `pubM`, `pubY`) VALUES ('" + str(df['title'][i]) + "','" + str(df['link'][i]) + "','" + str(df['pubDate'][i]) + "','" + str(df['numID'][i]) + "','" + str(df['pubT'][i]) + "','" + str(df['pubD'][i]) + "','" + str(df['pubM'][i]) + "','" + str(df['pubY'][i]) + "')"
                # print(sql)
                engine.connect().execute(sql)
            # else:
            #     print("NOT INSERT")
    else:
        print('No Directory')


def upload_access():

    import pandas as pd
    from datetime import datetime
    import os

    import sqlalchemy as sa
    from configparser import ConfigParser

    #Read config.ini file
    config_object = ConfigParser()
    config_object.read("config.ini")

    access_info = config_object["DB_Access"]
    username = access_info["username"]
    passwd = access_info["passwd"]
    access_path = access_info["database_path"]

    import sqlalchemy as sa
    driver = "{Microsoft Access Driver (*.mdb, *.accdb)}"

    connection_string = (
        f"DRIVER={driver};"
        f"DBQ={access_path};"
        f"PWD={passwd};"
        f"ExtendedAnsiSQL=1;"
    )
    connection_url = sa.engine.URL.create(
        "access+pyodbc",
        username=username,
        password=passwd,
        query={"odbc_connect": connection_string}
    )
    engine = sa.create_engine(connection_url)

    today = datetime.now().strftime('%d%m%Y')
    tomonth = datetime.now().strftime('%B')
    toyear = datetime.now().strftime('%Y')

    path_location = 'EGP/' + toyear+ '/' + tomonth

    file_csv = path_location + '/' + today + '.csv'

    if os.path.isfile(file_csv) == True:
        df = pd.read_csv(file_csv)
        # print(df)
        def loopcheck(link_):
            sql = "SELECT * FROM EGP WHERE link='" + link_ + "'"
            data = engine.connect().execute(sql).fetchall()
            return data

        for i in range(len(df['link'])):
            # print(loopcheck(i))
            if loopcheck(df['link'][i]) == []:
                sql = "INSERT INTO EGP (title, link, pubDate, numID, pubT, pubD, pubM, pubY) VALUES ('" + str(df['title'][i]) + "','" + str(df['link'][i]) + "','" + str(df['pubDate'][i]) + "','" + str(df['numID'][i]) + "','" + str(df['pubT'][i]) + "','" + str(df['pubD'][i]) + "','" + str(df['pubM'][i]) + "','" + str(df['pubY'][i]) + "')"
                # print(sql)
                engine.connect().execute(sql)
            # else:
            #     print("NOT INSERT")
    else:
        print('No Directory')






print("""

                            AutoEGP By Avatart0Dev :)

""")


from tqdm.auto import tqdm

bar = tqdm(["1", "2", "3"], desc='Processing', colour='GREEN', ncols=100)
text = ""
for char in bar:
    if char == "1":
        auto_egp()
    elif char == "2":
        data_duplicate()
    else:
        upload_mariadb()
    text = text + char
print('Succeed to Complete.!')