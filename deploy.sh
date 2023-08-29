cd database
docker build -t db:latest .

cd ../webapp
docker build -t django-webapp:latest .
