FROM ubuntu:latest
ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ> /etc/timezone
RUN apt-get update -y && apt install apache2 -y
ADD .  /var/www/html/
ENTRYPOINT apache2ctl -D FOREGROUND
ENV Manikumar suragam
EXPOSE 80
