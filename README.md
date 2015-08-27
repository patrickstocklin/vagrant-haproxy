# vagrant-haproxy
Vagrant VMs that demonstrate HAProxy's load-balancing/session-persistence

Requirements: Vagrant, Virtualbox

Within the directory you clone the repo, command vagrant to initialize the 3 virtual machines with:
```vagrant up --provision```

After instantiating, you may open your favorite browser and verify that both webservers are running by visiting http://localhost:8080/haproxy?stats. From there you can see information on both servers. You can visit each server within your private network by traveling to 172.16.0.2 and 172.16.0.3

Visit http://localhost:8081 and you should land yourself on either webserver's home page. If you refresh, you should still visit the same webserver. This demonstrates our HAProxy's session-persistence through cookies.

SSH into the other webserver with ```vagrant ssh webserver1```, and simulate an outtage by typing:
```sudo service apache2 stop```. You can go back to HAProxy's stats page and verify that your particular server has stopped. Upon refreshing http://localhost:8081, you will find yourself on your other, untouched webserver. This demonstrates HAProxy's load-balancing.

To resume a webserver, type ```sudo service apache2 start```. You can verify that both servers are up and running on the HAProxy stats page, but the client with cookies will now only visit the remaining server thanks to session-persistence.

Halt the VMs with ```vagrant halt```.

Links to helpful articles/demos:
http://blog.haproxy.com/2012/03/29/load-balancing-affinity-persistence-sticky-sessions-what-you-need-to-know/
