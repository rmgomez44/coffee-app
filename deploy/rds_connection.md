## MySQL Client (RDS)

**1. Install MySQL**

 - sudo apt-get update
 - sudo apt-get install mysql-server -y
 - sudo service mysql status

    > Use RDS "user": $RDS_USER

    > Use RDS "password": $RDS_PASSWORD

    > Use RDS "host": $RDS_HOST

**2. Connect to RDS**

 - mysql -u $RDS_USER -h $RDS_HOST -p

    > Input $RDS_PASSWORD

**3. Create "coffee" Database**

 - CREATE DATABASE coffee;

 - USE coffee;

  - CREATE TABLE IF NOT EXISTS `coffee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `roast` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `review` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

 - SHOW TABLES;

 - INSERT INTO `coffee` (`id`, `name`, `type`, `price`, `roast`, `country`, `image`, `review`) VALUES
(1, 'Cafe au Lait', 'Classic', 2.25, 'Medium', 'France', 'Images/Coffee/Cafe-Au-Lait.jpg', 'A coffee beverage consisting strong or bold coffee (sometimes espresso) mixed with scalded milk in approximately a 1:1 ratio.'')'),
(2, 'Caffe Americano', 'Espresso', 3.25, 'Medium', 'Italy', 'Images/coffee/caffe_americano.jpg', 'Similar in strength and taste to American-style brewed coffee, there are subtle differences achieved by pulling a fresh shot of espresso for the beverage base.'),
(3, 'Peppermint White Chocolate Mocha', 'Espresso', 3.25, 'Medium', 'Italy', 'Images/coffee/white-chocolate-peppermint-mocha.jpg', 'Espresso with white chocolate and peppermint flavored syrups and steamed milk. Topped with sweetened whipped cream and dark chocolate curls.'),
(4, 'Galao', 'Latte', 4.2, 'Light', 'Portugal', 'Images/Coffee/galao_kaffee_portugal.jpg', 'Galao is a hot drink from Portugal made of espresso and foamed milk');

**4. Validate Records**

 - select * from coffee;


## Integrate EC2 - RDS

**1. Configure integration EC2 - RDS**

 - nano /var/www/html/Model/Credentials.php

**2. Modify the following values:**

 - $host, with the RDS private ip
 - $user, with the RDS username
 - $passwd, with the RDS password
 - $database, This must be "coffee". Just as the database created on the previous step

**3. Restart the apache service**

 - sudo /etc/init.d/apache2 restart