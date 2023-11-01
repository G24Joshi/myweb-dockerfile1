FROM ubuntu
MAINTAINER g9ganesh.joshi@hotmail.com
RUN apt-get update 
RUN apt-get install -y apache2
RUN mkdir /var/www/example1.com
RUN chown -R $USER:$USER /var/www/example1.com
RUN chmod -R 755 /var/www/example1.com
COPY index.html /var/www/example1.com
COPY example1.com.conf /etc/apache2/sites-available/
RUN a2ensite example1.com
RUN a2dissite 000-default.conf 
RUN apache2ctl configtest
EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]
