sudo docker build -t skataria/webapp:latest web/

sudo docker build -t skataria/apiapp:latest api/

cat /opt/login.txt |sudo docker login --username skataria --password-stdin

sudo docker push skataria/webapp:latest
sudo docker push skataria/apiapp:latest
