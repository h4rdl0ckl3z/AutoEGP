# AutoEGPV2.3.0 Python ≥3.8 (STSBBS)

# How to install Packages
    pip install -r requirements.txt

## MariaDB recommented v10.x.x
## Base Database: MariaDB

# How to fixed : lookuperror unknown encoding windows-874

Location C:\Users\username\AppData\Local\Programs\Python\Python[version]\Lib\encodings

Edit aliases.py

    # cp874 codec
    '874'                : 'cp874',
    'windows_874'        : 'cp874',

# Linux Setup
## MariaDB recommented v10.x.x
## Base Database: MariaDB

    login with root
    apt install python3
    apt install python3-venv
    Download ZIP AutoEGP-STSBBS-2.3.0.zip
    cd AutoEGP-STSBBS-2.3.0
    python3 -m venv env
    pip install -r requirements.txt
    chmod +x AutoEGP.sh
    ./AutoEGP.sh
    
## Fixed: lookuperror unknown encoding windows-874

Location

    /usr/lib/python[version]/encodings/aliases.py or /usr/lib64/python[version]/encodings/aliases.py
    
Edit aliases.py

    # cp874 codec
    '874'                : 'cp874',
    'windows_874'        : 'cp874',

### use crontab
