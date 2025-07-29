vagrant ssh db01

cat /etc/hosts
# أضف IP و hostname إن لزم

sudo yum update -y

sudo yum install epel-release -y

sudo yum install git mariadb-server -y

sudo systemctl start mariadb
sudo systemctl enable mariadb


# يدويًا:
sudo mysql_secure_installation

# أو تلقائيًا (اختياري):
# sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'admin123'; FLUSH PRIVILEGES;"
# sudo mysql -uroot -padmin123 -e "DELETE FROM mysql.user WHERE User='';"
# sudo mysql -uroot -padmin123 -e "DROP DATABASE test;"
# sudo mysql -uroot -padmin123 -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';"
# sudo mysql -uroot -padmin123 -e "FLUSH PRIVILEGES;"

mysql -u root -padmin123 <<EOF
create database accounts;
grant all privileges on accounts.* TO 'admin'@'%' identified by 'admin123';
FLUSH PRIVILEGES;
exit;
EOF

git clone -b main https://github.com/hkhcoder/vprofile-project.git
cd vprofile-project
mysql -u root -padmin123 accounts < src/main/resources/db_backup.sql
mysql -u root -padmin123 accounts -e "show tables;"

sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd --get-active-zones
sudo firewall-cmd --zone=public --add-port=3306/tcp --permanent
sudo firewall-cmd --reload

sudo systemctl restart mariadb

echo "✅ MariaDB setup complete and accessible on port 3306"
