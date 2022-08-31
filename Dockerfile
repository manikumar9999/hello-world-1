FROM centos:7
MAINTAINER manikumar@gmail.com
RUN yum -y install httpd
ADD . /var/www/html/
ENTRYPOINT httptdctl -D FOREGROUND
ENV Manikumar suragam

EXPOSE 80
