# AutoEGPV2.1 Python ≥3.8 (STSBBS)

# How to install Packages
    pip install -r requirements.txt

# Database mariadb or mysql
# Database access


# How to fixed : lookuperror unknown encoding windows-874

Location C:\Users\username\AppData\Local\Programs\Python\Python[version]\Lib\encodings

Edit aliases.py

    # cp874 codec
    '874'                : 'cp874',
    'windows_874'        : 'cp874',

# Add Title

    list_test = {
        'title': [],
        'link': [],
        'pubDate': [],
        'numID': [],
        'pubT': [],
        'pubD': [],
        'pubM': [],
        'pubY': []
    }
    
# Add Data

    for root in tree.findall('./channel/item'):
        if root.tag == 'item':
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

            for rss in root:
                # print(rss.tag)
                if rss.tag == 'description' or rss.tag == 'guid':
                    pass
                else:
                    if rss.tag == 'pubDate':
                        list_test[rss.tag].append(rss.text)
                        pubDate_str = datetime.strptime(rss.text, '%Y-%m-%d').date()
                        list_test['pubD'].append(pubDate_str.strftime('%d'))
                        list_test['pubM'].append(pubDate_str.strftime('%m'))
                        list_test['pubY'].append(pubDate_str.strftime('%Y'))
                    else:
                        list_test[rss.tag].append(rss.text)

# Linux Setup

    login with root
    apt install python3
    apt-get install python3-venv
    git clone https://github.com/h4rdl0ckl3z/AutoEGPV2.1.git
    cd AutoEGPV2.1
    python3 -m venv env
    pip install -r requirements.txt
    chmod +x AutoEGP.sh
    
## Fixed: lookuperror unknown encoding windows-874

Location

    /usr/lib/python[version]/encodings/aliases.py or /usr/lib64/python[version]/encodings/aliases.py
    
Edit aliases.py

    # cp874 codec
    '874'                : 'cp874',
    'windows_874'        : 'cp874',
