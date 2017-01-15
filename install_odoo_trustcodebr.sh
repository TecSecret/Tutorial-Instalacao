#! /bin/bash

echo "Esse script é focado na instalação do odoo V.10"
echo "este script usa o repositório oficial (Nightly)"

echo "Atualizando cache do sistema"
sudo apt-get update -y
sudo apt-get upgrade -y
echo "Instalando git e outras nescessidades"
sudo apt-get install git -y
sudo apt-get install nano -y

echo "instalando PostgresSql"
sudo apt install postgresql -y
echo "Instalação do PostgresSql completa"

echo "Instalando ##### Dependências Odoo #####"
sudo apt-get install --no-install-recommends python-pip -y
sudo apt-get install --no-install-recommends python-dev -y
sudo apt-get install --no-install-recommends libxml2-dev -y
sudo apt-get install --no-install-recommends libxslt-dev -y
sudo apt-get install --no-install-recommends libsasl2-dev -y
sudo apt-get install --no-install-recommends libldap2-dev -y
sudo apt-get install --no-install-recommends libpq-dev -y
sudo apt-get install --no-install-recommends libjpeg-dev -y
sudo apt-get install --no-install-recommends nodejs -y
sudo apt-get install --no-install-recommends npm -y
sudo apt-get install node-less -y
sudo apt-get install gcc -y

echo "instalando ##### Dependências da Localização Brasileira #####"
sudo apt-get install --no-install-recommends python-libxml2 -y
sudo apt-get install --no-install-recommends libxmlsec1-dev -y
sudo apt-get install --no-install-recommends python-openssl -y
sudo apt-get install --no-install-recommends python-cffi -y
 
echo "##### Dependências do WKHTMLTOX #####"
sudo apt-get install --no-install-recommends zlib1g-dev -y
sudo apt-get install --no-install-recommends fontconfig -y
sudo apt-get install --no-install-recommends libfreetype6 -y
sudo apt-get install --no-install-recommends libx11-6 -y
sudo apt-get install --no-install-recommends libxext6 -y
sudo apt-get install --no-install-recommends libxrender1 -y
sudo apt-get install --no-install-recommends libjpeg-turbo8 -y


Echo "Instalação das dependências pip"
sudo -H pip install --upgrade pip

sudo -H pip install Babel==1.3
sudo -H pip install Jinja2==2.7.3
sudo -H pip install Mako==1.0.1
sudo -H pip install MarkupSafe==0.23
sudo -H pip install Pillow==2.7.0
sudo -H pip install Python-Chart==1.39
sudo -H pip install PyYAML==3.11
sudo -H pip install Werkzeug==0.9.6
sudo -H pip install argparse==1.2.1
sudo -H pip install decorator==3.4.0
sudo -H pip install docutils==0.12
sudo -H pip install feedparser==5.1.3
sudo -H pip install gdata==2.0.18
sudo -H pip install gevent==1.0.2
sudo -H pip install greenlet==0.4.7
sudo -H pip install jcconv==0.2.3
sudo -H pip install lxml==3.4.1
sudo -H pip install mock==1.0.1
sudo -H pip install ofxparse==0.14
sudo -H pip install passlib==1.6.2
sudo -H pip install psutil==2.2.0
sudo -H pip install psycogreen==1.0
sudo -H pip install psycopg2==2.5.4
sudo -H pip install pyPdf==1.13
sudo -H pip install pydot==1.0.2
sudo -H pip install pyparsing==2.0.3
sudo -H pip install pyserial==2.7
sudo -H pip install python-dateutil==2.4.0
sudo -H pip install python-ldap==2.4.19
sudo -H pip install python-openid==2.2.5
sudo -H pip install pytz==2014.10
sudo -H pip install pyusb==1.0.0b2
sudo -H pip install qrcode==5.1
sudo -H pip install reportlab==3.1.44
sudo -H pip install requests==2.6.0
sudo -H pip install six==1.9.0
sudo -H pip install suds-jurko==0.6
sudo -H pip install vobject==0.6.6
sudo -H pip install wsgiref==0.1.2
sudo -H pip install XlsxWriter==0.7.7
sudo -H pip install xlwt==0.7.5
sudo -H pip install openpyxl==2.4.0-b1
sudo -H pip install boto==2.38.0
sudo -H pip install odoorpc
sudo -H pip install suds_requests
sudo -H pip install pytrustnfe
sudo -H pip install python-boleto
sudo -H pip install python-cnab
sudo -H pip install PyTrustNFe
sudo -H pip install http://labs.libre-entreprise.org/frs/download.php/897/pyxmlsec-0.3.1.tar.gz
echo "pip e seus requerimentos estão instalados."

echo "instalando o wkhtmltopdf e dependências"
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo apt-get install wkhtmltopdf -y
echo "wkhtmltopdf instalado com sucesso.

echo "instalando o repositório oficial odoo (Nightly)"
sudo wget -O - https://nightly.odoo.com/odoo.key | apt-key add -
sudo echo "deb http://nightly.odoo.com/10.0/nightly/deb/ ./" >> /etc/apt/sources.list
echo "repositório adicionado com sucesso."

echo "instalando o odoo 10"
sudo apt-get update
sudo apt-get install odoo -y
echo "odoo 10 instalado com sucesso."

echo "add localização brasileira da trustcode"
echo "este processo pode demorar um pouco."
sudo mkdir /opt/odoo
sudo cd /opt/odoo
git clone https://github.com/Trust-Code/odoo-brasil --branch 10.0
cd
echo "licalização brasileira adicionado com sucesso"

echo "configurar o arquivo de configuração do odoo"
echo "addons_path= /opt/odoo/odoo-brasil,/usr/lib/python2.7/dist-packages/odoo/addons" >> ~/etc/odoo/odoo.conf
echo "admin_passwd = admin" >> ~/etc/odoo/odoo.conf
echo "arquivo de configuração finalizado com sucesso."

echo "reiniciando o servidor. Após este processo acesse http://seuip:8069. Obrigado"
reboot

