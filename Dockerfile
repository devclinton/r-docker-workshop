# Start our image from rocker's rstudio image
# See https://github.com/rocker-org/rocker/wiki/Using-the-RStudio-image
# For use details on this image
FROM rocker/rstudio

# Add our R project directory
RUN mkdir -p /home/rstudio/r-docker-workshop
# Add our R environment script
ADD setup_environment.R /home/rstudio/r-docker-workshop
RUN /usr/local/bin/Rscript /home/rstudio/r-docker-workshop/setup_environment.R && \
    # Cleanup any R build files
     rm -rf /tmp/*
