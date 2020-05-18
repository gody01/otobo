# This is the build file for the OTOBO docker image.
# The database will run in a separate container. See docker-compose.yml

# See: https://perlmaven.com/getting-started-with-perl-on-docker
# See: http://mfg.fhstp.ac.at/development/webdevelopment/docker-compose-ein-quick-start-guide/

# Here are some commands for Docker newbys:
# show version:           sudo docker version
# build an image:         sudo docker build -t otobodocker .
# run the new image:      sudo docker run -v opt_otobo:/opt/otobo otobodocker .
# log into the new image: sudo docker run  -v opt_otobo:/opt/otobo -it otobodocker bash
# show running images:    sudo docker ps
# show available images:  sudo docker images
# list volumes :          sudo docker volume ls
# inspect a volumne:      sudo docker volume inspect opt_otobo

# use the latest Perl on Debian 10 (buster). As of 2020-05-15.
# cpanm is already installed
FROM perl:5.30.2-buster

# install some required Debian packages
RUN apt-get update
RUN apt-get -y install tree default-mysql-client

# install OTOBO
RUN mkdir /opt/otobo
COPY . /opt/otobo

# continue working in /opt/otobo
WORKDIR /opt/otobo

# just to see that it worked
CMD pwd && tree /opt/otobo
