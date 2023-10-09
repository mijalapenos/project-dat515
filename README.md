# Assignment 1

## Part 1

- Followed instructions for setting up Group3_network.
  - Swapped example credentials (1) with our group nr (3)
  - Same for router
- Altered security rules to allow SecureSocketShel connection to Virtual Machine
- Created a key pair and distributed the private key among group members
- Set up Virtual machine
- Created floating IP
- Successfully connected to virtual machine

No problems encountered during this part.

## Part 2

We executed `docker run -d -p 8080:80` without the `--name` option. To be able to stop and
remove the container we discovered the use of `docker ps`.

## Part 3

Initial problems with `docker-compose up`, fixed by removing the dash and running `docker compose up`.

## Part 4

Nothing I guess.

## Part 5

We decided to do a content management system (CMS) with a database. Because WordPress has already been used in one of the examples we used Joomla instead with a MySQL database.

We found a template of docker compose file at [https://hub.docker.com/_/joomla]().

There was a problem with the database connection at first. We looked in to `docker ps` and saw the port `3306` next to the database service. By adding it into the environment varible
```
JOOMLA_DB_HOST: joomladb:3306
```
similarly to the presented WordPress + MySQL compose example from part 4, we were able to get it working.

TODO: Explain the links option in Docker. Do we really need it?

The Joomla installation was deployed on `localhost:8080`.

To run locally, we had to specify `platform: linux/x86_64` in the MySQL service because of our computers running on the Apple Silicon chips.

# Assignment 2

## Part 3
During part 3 we had trouble with accessing the wordpress webpage. It turns out we used service file with the deployment config and vice versa. After fixing this everything worked fine.

## Part 4

Not working at first
Looked at logs using `kubectl logs deploy/joomla` and `kubectl logs deploy/mysql`

we used wrong name for the database deployment (`joomladb` instead of `mysql`)
we used wrong password for the joomla
```
- name: JOOMLA_DB_USER
  value: "db_user"
- name: JOOMLA_DB_PASSWORD
  value: "db_pass"
```

changed to
```
- name: JOOMLA_DB_USER
  value: "root"
- name: JOOMLA_DB_PASSWORD
  value: "password"
```

TODO: should we use nodeport in order for the port not to change?


we did a readiness probe in the end
however we had to change it to liveliness which ensures the pod is restarted if it fails the probe


we had type:NodePort for mysql as well, that was unnecessary because that exposed the database outside of the kubernetes server. After removing the NodePort type it stayed accessible inside but was not visible outside.



# Assignment 3 (michal)

for some reason things were not working without a problem, mysql was stuck in pending

User `kubectl describe pod mysql-6b44544b5-7zcrn` to see what's up

Got `persistentvolumeclaim "mysql-pvc" not found` error

had to run the steps 1 and 2 from A2/Part 3

Then got error `1 node(s) had untolerated taint {node.kubernetes.io/disk-pressure: }`

```
ubuntu@ip-172-31-57-220:~$ kubectl taint nodes --all  node-role.kubernetes.io/control-plane-
node/ip-172-31-57-220 untainted
```


# Advanced feature

## rancher.io pvc
Creating a persistent volume in Rancher will not create a storage volume. It only creates a Kubernetes resource that maps to an existing volume. Therefore, before you can create a persistent volume as a Kubernetes resource, you must have storage provisioned.
(https://ranchermanager.docs.rancher.com/how-to-guides/new-user-guides/manage-clusters/create-kubernetes-persistent-storage/manage-persistent-storage/about-persistent-storage#:~:text=Creating%20a%20persistent%20volume%20in,you%20must%20have%20storage%20provisioned.)

we don't need ReadWriteMany access monde because replicas are in the same node and this refers to the nodes

