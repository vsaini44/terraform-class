#!/bin/bash
yum install httpd -y 
service httpd start
chkconfig httpd on
echo "hi there" > /var/www/html/index.html
systemctl enable httpd

