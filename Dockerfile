FROM rocker/binder:4.2.2

COPY install.R /tmp/install.R
RUN Rscript /tmp/install.R

# Copy everything in the repo
COPY . /home/rstudio/

# Move the original folder (which may have root-owned files)
RUN mv /home/rstudio/hannahs_unix_cafe /home/rstudio/temp_hannahs_unix_cafe && \
    cp -r /home/rstudio/temp_hannahs_unix_cafe /home/rstudio/hannahs_unix_cafe && \
    chmod -R 777 /home/rstudio/hannahs_unix_cafe && \
    rm -rf /home/rstudio/temp_hannahs_unix_cafe

# Drop to rstudio user as required by Binder
USER rstudio
