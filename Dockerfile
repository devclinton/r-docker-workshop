# Start our image from rocker's rstudio image
# See https://github.com/rocker-org/rocker/wiki/Using-the-RStudio-image
# For use details on this image
FROM rocker/rstudio

# Fetch latest indexes and upgrade any old packages
RUN apt update && apt upgrade -y

# Disable interactive questions like Timezone selection
ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true

# Add our R project directory
RUN mkdir -p /home/rstudio/r-docker-workshop
# Add our R environment script
ADD setup_environment.R /home/rstudio/r-docker-workshop
RUN /usr/local/bin/Rscript /home/rstudio/r-docker-workshop/setup_environment.R && \
    # Cleanup any R build files
     rm -rf /tmp*
