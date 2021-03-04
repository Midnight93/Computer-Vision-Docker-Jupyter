FROM jupyter/scipy-notebook

USER root
RUN  apt-get update
RUN  apt install -y software-properties-common

LABEL maintainer="ErGenziana <edoardopiccari@gmail.com>"

# Install Tensorflow
RUN pip install --quiet --no-cache-dir \
    'tensorflow==2.4.1' && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
    
RUN apt-get install -y gnupg2    

RUN apt install -y nvidia-cuda-toolkit

COPY cuda-ubuntu1804.pin cuda-ubuntu1804.pin

RUN mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600 && \
    apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub && \
    add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/ /" && \
    apt-get update

COPY nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb

RUN apt install ./nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb && \
    apt-get update

RUN apt-get install -y --no-install-recommends nvidia-driver-450

COPY libnvinfer7_7.1.3-1+cuda11.0_amd64.deb libnvinfer7_7.1.3-1+cuda11.0_amd64.deb

RUN apt install -y ./libnvinfer7_7.1.3-1+cuda11.0_amd64.deb && \
    apt-get update

RUN apt-get install -y --no-install-recommends \
    cuda-11-0  \
    libcudnn8=8.0.4.30-1+cuda11.0  \
    libcudnn8-dev=8.0.4.30-1+cuda11.0

RUN apt-get install -y --no-install-recommends libnvinfer7=7.1.3-1+cuda11.0 \
    libnvinfer-dev=7.1.3-1+cuda11.0  \
    libnvinfer-plugin7=7.1.3-1+cuda11.0

COPY jupyter.pem /etc/ssl/notebook/jupyter.pem
COPY requirements.txt requirements.txt
RUN  pip install -r requirements.txt
