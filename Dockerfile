#Start with Rstudio base
FROM rocker/rstudio

MAINTAINER Matt Espe

#Update
RUN apt-get update

#Install pdfto
RUN apt-get install -y poppler-utils zlib1g-dev libxml2-dev

RUN git clone https://github.com/dsidavis/pdftohtml.git \
	&& cd pdftohtml \
	&& make \
	&& cp src/pdftohtml /usr/bin/
	
# Avoid using devtools - takes a while to install
RUN Rscript -e 'install.packages("XML")'

RUN git clone https://github.com/dsidavis/ReadPDF.git \
	&& cd ReadPDF \
	&& R CMD INSTALL .
	

