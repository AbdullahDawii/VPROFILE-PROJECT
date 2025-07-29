#!/bin/bash

sudo -i
dnf --nogpgcheck --setopt=baseos.skip_if_unavailable=true install memcached -y || true

# شغل الخدمة
systemctl start memcached || true
systemctl enable memcached || true

# إعداد الاتصال الخارجي
sed -i 's/OPTIONS="-l 127.0.0.1,::1"/OPTIONS="-l 0.0.0.0"/' /etc/sysconfig/memcached || true

# إعادة التشغيل
systemctl restart memcached || true

# الجدار الناري
systemctl start firewalld || true
systemctl enable firewalld || true
firewall-cmd --permanent --add-port=11211/tcp || true
firewall-cmd --reload || true

echo "✅ Memcached has been installed and configured on port 11211"
