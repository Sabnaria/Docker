FROM ubuntu:latest 
LABEL Maintainer="Martyna Debowczyk"

RUN apt update 
#lepiej wybrac run niz entrypoint poniewa run jest uywane do budowania docker images
RUN apt install -y apache2

COPY ./indeks.html /var/www/html/index.html
EXPOSE 8080
ENTRYPOINT ["apachectl", "-D", "FOREGROUND"]
#w tym wypadku wybrałam entrypoint ze względu na to ze podstawowym zadaniem w tym laboratorium bylo stworzenie obrazu wyswietlajacego strone ww z imieniem i nazwiskiem 
# tak na podstawie tego Dockerfile mona zbudować obraz, posiada on wtedy 4 warstwy, ktore maja "znaczenie" (budowa ich trwa dluzej niz 0s)