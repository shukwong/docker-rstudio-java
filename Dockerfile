FROM rocker/tidyverse:3.6.1

# Install java and rJava
RUN apt-get -y update && apt-get install -y \
   default-jdk \
   r-cran-rjava \
   && apt-get clean \
   && rm -rf /var/lib/apt/lists/


# Install further R packages
RUN install2.r --error --deps TRUE \
   devtools \
   drat \
   && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# Initialize rocker/rstudio
CMD ["/init"]


