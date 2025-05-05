ROM rocker/binder:4.2.2

COPY install.R /tmp/install.R
RUN Rscript /tmp/install.R

# Copy everything in the repo, including the locked hannahs_unix_cafe/
COPY . /home/rstudio/

# Make a writable copy
RUN cp -r /home/rstudio/readonly /home/rstudio/hannahs_unix_cafe && \
    chmod -R 777 /home/rstudio/hannahs_unix_cafe

USER rstudio
