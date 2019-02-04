# Ravennodes

This project is based on [Bitnodes](https://github.com/ayeowch/bitnodes).

Ravennodes is currently being developed to estimate the size of the Ravencoin network by finding all the reachable nodes in the network. These are the nodes that accept incoming connections. Why you should run a full node is explained here on the [Bitcoin wiki](https://en.bitcoin.it/wiki/Full_node). The current methodology involves sending [`getaddr`](https://en.bitcoin.it/wiki/Satoshi_Client_Node_Discovery) messages recursively to find all the reachable nodes in the network, starting from a set of seed nodes. It is worth mentioning that this method of estimating network size [does not list all full nodes](https://en.bitcoin.it/wiki/Clearing_Up_Misconceptions_About_Full_Nodes) because not all nodes have an open port that can be probed using Ravennodes. These nodes are either behind firewalls or they are configured to not listen for connections. 

## Dependencies:
- Python 2.7
- [Redis](https://redislabs.com/)

## Steps on setting up a machine to run Ravennodes 
TBA

## Further development
TBA
____
First tests on Feb 3rd, 2019, indicate that Ravennodes is working on Ubuntu 18.04.
