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
