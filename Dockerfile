FROM ubuntu:latest

LABEL maintainer="Podpora <s95531@pollub.edu.pl>"

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y apache2

# Skopiowanie strony HTML do katalogu serwera
COPY index.html /var/www/html/

RUN sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf
RUN sed -i 's/:80/:8080/' /etc/apache2/sites-available/000-default.conf

EXPOSE 8080

CMD ["apachectl", "-D", "FOREGROUND"]
