FROM rocker/cuda:3.5.2
RUN R -e "install.packages('pryr')"
RUN apt update && apt install  ocl-icd-* opencl-headers  -y 
RUN R -e "install.packages('gpuR')"