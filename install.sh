#!/usr/bin/env bash


## Install General Requirements
sudo apt-get update && apt-get install -y --no-install-recommends \
        apt-utils \
        build-essential \
        cmake \
        git \
        wget \
        vim \
        apt-utils
sudo echo "Done Install General Requirements \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
export DEBIAN_FRONTEND=noninteractive

sudo apt-get update && apt-get install -y --no-install-recommends \
        python-dev \
        python-pip \
        python-setuptools \
        mlocate \
        bc
sudo pip install --upgrade pip
## Install Basics for Python
sudo apt-get update && apt-get install -y --no-install-recommends \
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

sudo apt-get update && apt-get install -y --no-install-recommends\
    libopencv-dev \
    libfftw3-dev \
    libfftw3-doc

# library for SiftGPU, glut glew IL
sudo apt-get update && apt-get install -y --no-install-recommends\
    libglew-dev \
    freeglut3-dev \
    libdevil1c2 \
    libdevil-dev

sudo pip install aggdraw
# install gdal-bin and its dependence
sudo apt-get install -y --no-install-recommends \
    gdal-bin \
    libqhull-dev \
    libgeotiff-dev
sudo apt-get install -y --no-install-recommends \
   gfortran

sudo apt-get install -y --no-install-recommends \
   python-gdal

sudo apt-get install -y --no-install-recommends python-tk
sudo pip install pillow
sudo pip install matplotlib

#set timezone
export TZ="Asia/Shanghai"
sudo ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# fix gdal error
sudo ln -s /usr/lib/x86_64-linux-gnu/libproj.so.9 /usr/lib/x86_64-linux-gnu/libproj.so

export HOME=/home/root
#ENV PATH /home/root:$PATH
cd $HOME


#solve drawing issues in python and GMT4
sudo mkdir -p /Library/Fonts
cp Georgia.ttf /Library/Fonts/Georgia.ttf
sudo mkdir -p /home/hlc/bin
sudo ln -s ~/bin/GMT_4.5.14 /home/hlc/bin/GMT_4.5.14

#copy programs, includes SiftGPU and built GDAL (the SiftGPU and gdal are compiled in this Docker machine)
cp -r programs $HOME/programs
export PATH=$HOME/programs/gdal-2.2.4/bin:$PATH

##copy codes (projects)
cp -r codes $HOME/codes


#copy compiled excutalbe file (compiled in this Docker machine)
cp -r bin $HOME/bin




