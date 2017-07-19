#Start with Rstudio base
FROM rocker/rstudio

MAINTAINER Matt Espe

#Update
RUN apt-get update

#Install pdfto*
RUN apt-get install -y poppler-utils zlib1g-dev libxml2-dev

#Install packages
RUN Rscript -e "install.packages('devtools')"
RUN Rscript -e "devtools::install_github('dsidavis/ReadPDF')"

