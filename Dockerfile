FROM docker.io/centos:7
MAINTAINER manikumarsuragam9999@gmail.com
RUN yum -y install httpd
COPY index.html /var/www/html/
EXPOSE 80
CMD apachectl -D FOREGROUND
