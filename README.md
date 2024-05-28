# d_lab4

1. Zbudowanie obrazu:
   docker build -t web100 .

3. Uruchomienie kontenera:
   docker run -d -p 8080:8080 --name web100_container web100

4. Sprawdzenie działania serwera:
   curl http://localhost:8080

StatusCode        : 200
StatusDescription : OK
Content           : <!DOCTYPE html>
                    <html lang="pl">
                    <head>
                        <meta charset="UTF-8">
                        <title>Strona Studenta</title>
                    </head>
                    <body>
                        <h1>ImiÄ i Nazwisko: Dawid Podpora</h1>
                        <p>Grupa dziekaÅska: IO 6...
RawContent        : HTTP/1.1 200 OK
                    Vary: Accept-Encoding
                    Keep-Alive: timeout=5, max=100
                    Connection: Keep-Alive
                    Accept-Ranges: bytes
                    Content-Length: 226
                    Content-Type: text/html
                    Date: Tue, 28 May 2024 11:41:48 GMT...
Forms             : {}
Headers           : {[Vary, Accept-Encoding], [Keep-Alive, timeout=5, max=100], [Connection, Keep-Alive], [Accept-Ranges, bytes] 
                    ...}
Images            : {}
InputFields       : {}
Links             : {}
ParsedHtml        : System.__ComObject
RawContentLength  : 226

5. Sprawdzenie warstw obrazu:
   docker history web100

IMAGE          CREATED          CREATED BY                                      SIZE      COMMENT
4fd34172bf88   57 seconds ago   CMD ["apachectl" "-D" "FOREGROUND"]             0B        buildkit.dockerfile.v0
<missing>      57 seconds ago   EXPOSE map[8080/tcp:{}]                         0B        buildkit.dockerfile.v0
<missing>      57 seconds ago   RUN /bin/sh -c sed -i 's/:80/:8080/' /etc/ap…   1.29kB    buildkit.dockerfile.v0
<missing>      57 seconds ago   RUN /bin/sh -c sed -i 's/Listen 80/Listen 80…   276B      buildkit.dockerfile.v0
<missing>      58 seconds ago   COPY index.html /var/www/html/ # buildkit       226B      buildkit.dockerfile.v0
<missing>      58 seconds ago   RUN /bin/sh -c apt-get update && apt-get upg…   151MB     buildkit.dockerfile.v0
<missing>      58 seconds ago   LABEL maintainer=Podpora <s95531@pollub.edu.…   0B        buildkit.dockerfile.v0
<missing>      4 weeks ago      /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B
<missing>      4 weeks ago      /bin/sh -c #(nop) ADD file:ac9d5a9d5b9b1217a…   76.2MB
<missing>      4 weeks ago      /bin/sh -c #(nop)  LABEL org.opencontainers.…   0B
<missing>      4 weeks ago      /bin/sh -c #(nop)  LABEL org.opencontainers.…   0B
<missing>      4 weeks ago      /bin/sh -c #(nop)  ARG LAUNCHPAD_BUILD_ARCH     0B
<missing>      4 weeks ago      /bin/sh -c #(nop)  ARG RELEASE                  0B

Posiada on 13 warstw:
  Warstwa 1:
  Utworzona przez: ARG RELEASE
  Warstwa 2:
  Utworzona przez: ARG LAUNCHPAD_BUILD_ARCH
  Warstwa 3:
  Utworzona przez: LABEL org.opencontainers.image.version=latest
  Warstwa 4:
  Utworzona przez: LABEL org.opencontainers.image.revision=unknown
  Warstwa 5:
  Utworzona przez: ADD file
  Warstwa 6:
  Utworzona przez: CMD ["/bin/bash"]
  Warstwa 7:
  Utworzona przez: LABEL maintainer=Podpora s95531@pollub.edu.pl
  Warstwa 8:
  Utworzona przez: RUN /bin/sh -c apt-get update && apt-get upgrade -y && apt-get install -y apache2
  Warstwa 9:
  Utworzona przez: COPY index.html /var/www/html/
  Warstwa 10:
  Utworzona przez: RUN /bin/sh -c sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf
  Warstwa 11:
  Utworzona przez: RUN /bin/sh -c sed -i 's/:80/:8080/' /etc/apache2/sites-available/000-default.conf
  Warstwa 12:
  Utworzona przez: EXPOSE 8080/tcp
  Warstwa 13:
  Utworzona przez: CMD ["apachectl", "-D", "FOREGROUND"]
  
