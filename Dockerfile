FROM rocker/binder:4.2.2

# Install additional R packages (optional)
COPY install.R /tmp/install.R
RUN Rscript /tmp/install.R

COPY . /home/rstudio/

# Default to user rstudio for Binder
USER aggie
