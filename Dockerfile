#Start with Rstudio base
FROM rocker/rstudio

MAINTAINER Matt Espe

#Update
RUN apt-get update
RUN apt-get upgrade -y --fix-missing

#Install pdfto
RUN apt-get install -y poppler-utils zlib1g-dev libxml2-dev r-cran-rjava

RUN git clone https://github.com/dsidavis/pdftohtml.git \
	&& cd pdftohtml \
	&& make \
	&& cp src/pdftohtml /usr/bin/
	
# Avoid using devtools - takes a while to instal
RUN git clone https://github.com/omegahat/XML.git \
	&& cd XML \
	&& R CMD INSTALL .

RUN git clone https://github.com/dsidavis/ReadPDF.git \
	&& cd ReadPDF \
	&& R CMD INSTALL .

RUN echo '.libPaths(c("/usr/lib/R/site-library/", .libPaths()))' >> ~/.Rprofile

