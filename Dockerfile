FROM debian:stable-slim
MAINTAINER creecros <creecros@gmail.com>                                                                                                                 

ENV APACHE_RUN_USER www-data                                                                                                                             
ENV APACHE_RUN_GROUP www-data                                                                                                                            
ENV APACHE_LOG_DIR /var/log/apache2                                                                                                                      
ENV APACHE_LOCK_DIR /var/lock/apache2                                                                                                                    
ENV APACHE_PID_FILE /var/run/apache2.pid 

CMD ["bash"]

COPY ltb-project.list /etc/apt/sources.list.d/ltb-project.list

RUN apt-get update
RUN apt-get -y install wget
RUN wget -O - https://ltb-project.org/wiki/lib/RPM-GPG-KEY-LTB-project | sudo apt-key add -
RUN apt-get update
RUN apt-get -y install apache2 php5 php5-ldap php5-mcrypt self-service-password
RUN a2enmod php5                                                                                                                                         
RUN a2enmod rewrite

WORKDIR /

EXPOSE 8080
