FROM centos:7
MAINTAINER surgammanikumar@gmail.com
RUN yum update -y && yum install httpd -y
EXPOSE 80
COPY index.html /var/www/html/
CMD [“/usr/sbin/httpd”, “-D”, “FOREGROUND”]
