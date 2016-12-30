# Tutorial Instalação do Odoo no Ubuntu Server 16.10 

Para instala a versão DEV ou Development utilize o arquivo [install_odoo_trustcodebr.sh](install_odoo_trustcodebr.sh).



Para instalar o odoo em versao do produção use os passos abaixo:

# 1º Passo - Instalar o Postgres

- Atualizar o sistema antes de tudo
    * sudo apt-get update

- Instalar o postgresql
    * sudo apt-get install postgresql
 

# 2º Passo - Baixar as dependências do Odoo

* Baixaro o arquivo [dependencias apt-get](apt-requirements)
* Baixar o arquivo [dependencias pip](pip-requirements)

* Pode ocorrer de dar erro na execução devido a baixar como html o arquivo, ai indicamos para você a excluir o arquivo baixado e criar um com o mesmo nome e conteúdo disponível no git.

* sudo apt-get install -y --no-install-recommends $(grep -v '^#' apt-requirements)
* sudo pip install --upgrade pip
* sudo pip install -r pip-requirements
* sudo npm install -g less
* sudo ln -s /usr/bin/nodejs /usr/bin/node
* sudo apt-get install -y wkhtmltopdf


# 3º Passo - Baixar o código do Odoo (repo oficial Nightly)

* wget -O - https://nightly.odoo.com/odoo.key | apt-key add -
* echo "deb http://nightly.odoo.com/10.0/nightly/deb/ ./" >> /etc/apt/sources.list


# 4º Passo - Instalar o Odoo

* apt-get -y update && apt-get install -y odoo

# 6º Passo - Testar se o Odoo foi instalado
* http://seuip:8069
* Importante: Quando abrir a página da web do odoo não configurar banco de dados nada.

# 7º Passo - Instalar a localização Brasileira 
* mkdir /opt/odoo
* cd /opt/odoo
* git clone https://github.com/Trust-Code/odoo-brasil --branch 10.0
* git clone https://github.com/OCA/server-tools --branch 10.0
* git clone https://github.com/OCA/reporting-engine --branch 10.0
* git clone https://github.com/OCA/account-fiscal-rule --branch 10.0

* nano /etc/odoo/odoo.conf
* Edite a linha addons_patch adicionando as pastas "odoo-brasil,server-tools,reporting-engine,account-fiscal-rule"  /opt/odoo/pasta_clonada e salve o arquivo e reinicie o serviço do Odoo.
* Acesse http://ip_do_server:8069/web/database e configure um banco de dados para uso.
* Na interface para instalação de aplicativos procure por Brasil e instale a localização brasileira mantida pea Truste Code.

* É importante que você busque na pesquisa de aplicativos por BR e instale 1 por 1 separadamente dando preferência para os apresentados como Trust Code. Este procedimento evita muitos erros.
