Log:
Part 1
-Followed instructions for setting up Group3_network.
  -Swapped example credentials (1) with our group nr (3)
  -Same for router
-Altered security rules to allow SecureSocketShel connection to Virtual Machine
-Created a key pair and distributed the private key among group members
-Set up Virtual machine
-Created floating IP
-Successfully connected to virtual machine

No problems encountered during this part.

Part 2
We executed docker run -d -p 8080:80 without --name. To be able to stop and
remove the container we discovered the use of docker ps

Part 3
Initial problems with docker-compose up, fixed by removing (-)

