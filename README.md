# Ravennodes
This project is based on [Bitnodes](https://github.com/ayeowch/bitnodes).

Ravennodes is currently being developed to estimate the size of the Ravencoin network by finding all the reachable nodes in the network. These are the nodes that accept incoming connections. Why you should run a full node is explained here on the [Bitcoin wiki](https://en.bitcoin.it/wiki/Full_node). The current methodology involves sending [`getaddr`](https://en.bitcoin.it/wiki/Satoshi_Client_Node_Discovery) messages recursively to find all the reachable nodes in the network, starting from a set of seed nodes. It is worth mentioning that this method of estimating network size [does not list all full nodes](https://en.bitcoin.it/wiki/Clearing_Up_Misconceptions_About_Full_Nodes) because not all nodes have an open port that can be probed using Ravennodes. These nodes are either behind firewalls or they are configured to not listen for connections. 

## Main Changes
- Changed parameters to support Ravencoin
- Turned off Tor network support.

## Dependencies
- Python 2.7
- [Redis](https://redislabs.com/)

## Steps on setting up a machine to run Ravennodes 
### Ubuntu 18.04, 16GB RAM Machine:
#### Install redis 
```
sudo apt update && sudo apt upgrade
cd ~/
sudo apt install redis

# I prefer running redis manually
# Optional, remove the service: sudo service redis-server disable
```
#### Install Ravennodes and set up dependencies
```
git clone https://github.com/jeroz1/Ravennodes.git
#Move redis conf file
sudo cp ~/Ravennodes/depends/redis/redis.conf /etc/redis/
#Install Python requirements
cd ~/Ravennodes
pip install -r requirements.txt
#Update GeoIP
bash geoip/update.sh
```

**NOTE:** For GeoIP, you now need an account at maxmind.com and acquire a license key. Add this key to `~/.bashrc`:
```
export MAXMIND_LICENSE_KEY=YOUR-KEY-HERE
```

#### Update open file limits to prevent Ravennodes crashing on IO errors
```
# Edit the following file:
sudo nano /etc/security/limits.conf
	#Add the following:
	* soft nofile 1000000
	* hard nofile 1000000
 	root soft nofile 1000000
	root hard nofile 1000000
	
# If you run an Ubuntu GUI, Edit the following files too:
sudo nano /etc/systemd/user.conf
	#Change the following setting:
	DefaultLimitNOFILE=1000000
sudo nano /etc/systemd/system.conf 
	#Change the following setting:
	DefaultLimitNOFILE=1000000
```
#### Start redis service
```
#Login as admin
sudo -i
#Update /proc/sys/net/core/somaxconn
sysctl -w net.core.somaxconn=511
#Disable THP
echo never > /sys/kernel/mm/transparent_hugepage/enabled
# Set overcommit_memory to 1
sysctl vm.overcommit_memory=1
#Start Redis Server
redis-server /etc/redis/redis.conf
#Alternatively, run redis in the background with redis-server /etc/redis/redis.conf --daemonize yes

#Make sure the file redis.sock is made in /tmp/
```
#### To start the Ravennodes crawler
Open a new console and start the crawler:
```
cd ~/Ravennodes
./start.sh
```
Data output will be available in `~/Ravennodes/data/export/5241564e`

Process logs  will be available in `~/Ravennodes/log`
___

-Jeroz


