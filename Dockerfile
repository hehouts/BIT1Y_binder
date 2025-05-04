FROM rocker/binder:4.2.2

# Install additional R packages (optional)
COPY install.R /tmp/install.R
RUN Rscript /tmp/install.R

# Copy and install Python packages
COPY environment.yml /tmp/environment.yml
RUN conda env update -f /tmp/environment.yml

COPY . /home/rstudio/

# Default to user rstudio for Binder
USER rstudio
