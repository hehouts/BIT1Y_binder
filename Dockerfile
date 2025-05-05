FROM rocker/binder:4.2.2

# Install additional R packages (optional)
COPY install.R /tmp/install.R
RUN Rscript /tmp/install.R

# Copy everything (including hannahs_unix_cafe) as root
COPY . /home/rstudio/

# Copy + chmod temp workaround BEFORE switching users
COPY hannahs_unix_cafe/ /home/rstudio/hannahs_unix_cafe_temp/
RUN cp -r /home/rstudio/hannahs_unix_cafe_temp /home/rstudio/hannahs_unix_cafe && \
    chmod -R 777 /home/rstudio/hannahs_unix_cafe && \
    rm -rf /home/rstudio/hannahs_unix_cafe_temp

# Now drop privileges to rstudio user for Binder
USER rstudio
