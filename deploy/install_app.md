# Coffee Website

## Install Web (Ubuntu 18.04)

**1. Dependencies Installation**

 - sudo su
 - sudo apt-get update
 - sudo apt-get install php libapache2-mod-php -y
 - sudo apt-get install php-mysqli -y
 - sudo apt-get install unzip -y

**2. Application Download**

 - cd /home/ubuntu
 - wget -O app.zip "zip_url"
  - If the zip_url has the following form (`https://drive.google.com/file/d/example/view?usp=share_link`), replace `file/d/` with `uc?id=` and `/view?usp=share_link` with `&export=download` leaving zip_url as `https://drive.google.com/uc?id=example&export=download`
 - unzip app.zip
 - cd /home/ubuntu/web-coffee-repository

**3. Apache Deploy**

 - cp -r * /var/www/html
 - sudo /etc/init.d/apache2 restart

**4. Apache Configuration**

 - chmod 777 /etc/php/7.2/apache2/php.ini
 - sed 's+;extension=mysqli+extension=mysqli+g' /etc/php/7.2/apache2/php.ini >> /etc/php/7.2/apache2/bk_php.ini
 - rm /etc/php/7.2/apache2/php.ini
 - mv /etc/php/7.2/apache2/bk_php.ini /etc/php/7.2/apache2/php.ini
 - sudo /etc/init.d/apache2 restart

**5. Validating index.php**

 - Check: http://PUBLIC_IP/index.php (If instance has a public ip)
 - Check: http://PRIVATE_IP/index.php (If instance has a private ip, this has to be done through another instance in the same vpc, either by ssh tunneling or a vpn)

**6. Validación Coffee.php**

 - Check: http://PUBLIC_IP/Coffee.php (If instance has a public ip)
 - Check: http://PRIVATE_IP/Coffee.php (If instance has a private ip, this has to be done through another instance in the same vpc, either by ssh tunneling or a vpn)
 - This page will be visible once the RDS connection has been implemented
