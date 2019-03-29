FROM rocker/cuda:3.5.2
RUN R -e "install.packages('pryr')"
RUN apt-get update && \
    apt-get upgrade && \
    apt-get install aptitude -y && \
     aptitude install cuda opencl-headers -y 
ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true
RUN mkdir -p /usr/lib/nvidia
RUN apt-get install -y libcuda1-418 
RUN ldconfig -p | grep 'libOpenCL\|lOpenCL'
RUN aptitude install -y ocl-icd-libopencl1 libopencl1
RUN ldconfig -p | grep 'libOpenCL\|lOpenCL'
RUN R -e "install.packages('RViennaCL')"
RUN R -e "install.packages('gpuR')"