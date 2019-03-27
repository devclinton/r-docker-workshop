# Start our image from rocker's rstudio image
# See https://github.com/rocker-org/rocker/wiki/Using-the-RStudio-image
# For use details on this image
FROM rocker/rstudio

# update package indexes
RUN apt-get update && \
     # install libxml2-dev for rattle
     apt-get install libxml2-dev -y

# Add our R project directory
RUN mkdir -p /home/rstudio/r-docker-workshop/scripts
# Add our R environment script
ADD setup_environment.R /home/rstudio/r-docker-workshop
RUN /usr/local/bin/Rscript /home/rstudio/r-docker-workshop/setup_environment.R

# Bake in the data and the scripts for Publishing
# To Reduce confusion you may want to comment this out during development
ADD data scripts /home/rstudio/r-docker-workshop/
