FROM rocker/binder:4.2.2

# Install additional R packages (optional)
COPY install.R /tmp/install.R
RUN Rscript /tmp/install.R

# Default to user rstudio for Binder
USER rstudio
