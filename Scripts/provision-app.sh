#!/bin/bash

# 4. TOMCAT SETUP
sudo -i
# تحديث النظام
yum update -y

# تفعيل المستودعات المطلوبة
yum install epel-release -y

# تثبيت الجافا والمكتبات المطلوبة
dnf -y install java-11-openjdk java-11-openjdk-devel
dnf install git maven wget -y

# تحميل وتثبيت Tomcat
cd /tmp/
wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.75/bin/apache-tomcat-9.0.75.tar.gz
tar xzvf apache-tomcat-9.0.75.tar.gz

# إضافة مستخدم tomcat بدون صلاحية الدخول التفاعلي
useradd --home-dir /usr/local/tomcat --shell /sbin/nologin tomcat

# نسخ الملفات إلى مجلد Tomcat
cp -r /tmp/apache-tomcat-9.0.75/* /usr/local/tomcat/
chown -R tomcat:tomcat /usr/local/tomcat

# إنشاء ملف systemd لخدمة Tomcat
cat << 'EOF' > /etc/systemd/system/tomcat.service
[Unit]
Description=Tomcat
After=network.target
[Service]
User=tomcat
WorkingDirectory=/usr/local/tomcat
Environment=JRE_HOME=/usr/lib/jvm/jre
Environment=JAVA_HOME=/usr/lib/jvm/jre
Environment=CATALINA_HOME=/usr/local/tomcat
Environment=CATALINE_BASE=/usr/local/tomcat
ExecStart=/usr/local/tomcat/bin/catalina.sh run
ExecStop=/usr/local/tomcat/bin/shutdown.sh
SyslogIdentifier=tomcat-%i
[Install]
WantedBy=multi-user.target
EOF

# تفعيل خدمة tomcat
systemctl daemon-reload
systemctl start tomcat
systemctl enable tomcat

# إعداد الجدار الناري
systemctl start firewalld
systemctl enable firewalld
firewall-cmd --zone=public --add-port=8080/tcp --permanent
firewall-cmd --reload

# تحميل الكود المصدري وبناؤه
cd /opt
git clone -b main https://github.com/hkhcoder/vprofile-project.git
cd vprofile-project

# ملاحظة: تأكد من أنك تحدث application.properties يدويًا أو من خلال أمر sed هنا

# بناء المشروع
mvn install

# نشر الملف على tomcat
systemctl stop tomcat
rm -rf /usr/local/tomcat/webapps/ROOT*
cp target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war
chown -R tomcat:tomcat /usr/local/tomcat/webapps
systemctl start tomcat
systemctl restart tomcat
