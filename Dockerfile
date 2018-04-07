FROM nvidia/cuda:8.0-devel-ubuntu16.04
LABEL maintainer dlindenbaum

## Install General Requirements
RUN apt-get update && apt-get install -y --no-install-recommends \
        apt-utils \
        build-essential \
        cmake \
        git \
        wget \
        vim \
        apt-utils
RUN echo "Done Install General Requirements \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
        python-dev \
        python-pip \
        python-setuptools \
        mlocate \
        bc
RUN pip install --upgrade pip
## Install Basics for Python
RUN apt-get update && apt-get install -y --no-install-recommends \
        python-numpy \
        python-scipy

## Install GDAL Requirments (have issues of GDALLoadRPCFile, so build GDAL from sources)
#RUN apt-get install -y --no-install-recommends \
#     software-properties-common \
#     python-software-properties
#RUN apt-add-repository ppa:ubuntugis/ubuntugis-unstable
#RUN apt-get update && apt-get install -y --no-install-recommends\
#    libgdal-dev \
#    python-gdal
##
#RUN apt-get update && apt-get install -y --no-install-recommends\
#    gdal-bin

RUN apt-get update && apt-get install -y --no-install-recommends\
    libopencv-dev \
    libfftw3-dev \
    libfftw3-doc

# library for SiftGPU, glut glew IL
RUN apt-get update && apt-get install -y --no-install-recommends\
    libglew-dev \
    freeglut3-dev \
    libdevil1c2 \
    libdevil-dev

RUN pip install aggdraw
# install gdal-bin and its dependence
RUN apt-get install -y --no-install-recommends \
    gdal-bin \
    libqhull-dev \
    libgeotiff-dev
RUN apt-get install -y --no-install-recommends \
   gfortran

RUN apt-get install -y --no-install-recommends \
   python-gdal

RUN apt-get install -y --no-install-recommends python-tk
RUN pip install pillow
RUN pip install matplotlib

#set timezone
ENV TZ="Asia/Shanghai"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# fix gdal error
RUN ln -s /usr/lib/x86_64-linux-gnu/libproj.so.9 /usr/lib/x86_64-linux-gnu/libproj.so

ENV HOME /home/root
#ENV PATH /home/root:$PATH
WORKDIR $HOME

#copy bash file
COPY profile $HOME/.profile
COPY vimrc   $HOME/.vimrc
COPY bashrc  $HOME/.bashrc

#solve drawing issues in python and GMT4
COPY Georgia.ttf /Library/Fonts/Georgia.ttf
RUN mkdir -p /home/hlc/bin
RUN ln -s ~/bin/GMT_4.5.14 /home/hlc/bin/GMT_4.5.14

#copy programs, includes SiftGPU and built GDAL (the SiftGPU and gdal are compiled in this Docker machine)
COPY programs $HOME/programs
ENV PATH $HOME/programs/gdal-2.2.4/bin:$PATH

##copy codes (projects)
COPY codes $HOME/codes


#copy compiled excutalbe file (compiled in this Docker machine)
COPY bin $HOME/bin




