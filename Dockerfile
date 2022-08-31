FROM centos:7
MAINTAINER manikumar@gmail.com
RUN yum -y install httpd
COPY index.html /var/www/html/
CMD [“/usr/sbin/httpd”, “-D”, “FOREGROUND”]

EXPOSE 80
