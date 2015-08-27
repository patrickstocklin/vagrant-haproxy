#!/bin/bash
#Adapted from https://github.com/justintime/vagrant-haproxy-demo
#Shell script to install Apache Web Server onto Vagrant VM
if [ ! -f /etc/network/if-up.d/custom-networkd-config ]; then
	sudo apt-get update
	/usr/bin/sudo apt-get -y install apache2
	#Make a webpage that shows what server is hosting our connection
	#Must replace old Apache-donated index.html 
	cat > /var/www/html/index.html <<EOD
<html><head><title>${HOSTNAME}</title></head><body><h1>${HOSTNAME}</h1>
<p>Welcome to ${HOSTNAME}, Mr. Whyne.
<br>
You should only see one unique webpage no matter how many times you refresh, ssh into the VM
and stop apache2, then retry.</p>
</body></html>
EOD
	#Restart Service
	/usr/sbin/service apache2 restart
fi