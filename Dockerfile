# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM jupyter/scipy-notebook

LABEL maintainer="ErGenziana <edoardopiccari@gmail.com>"

# Install Tensorflow
RUN pip install --quiet --no-cache-dir \
    'tensorflow==2.4.1' && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

COPY jupyter.pem /etc/ssl/notebook/jupyter.pem
COPY requirements.txt requirements.txt
RUN  pip install -r requirements.txt
