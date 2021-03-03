# Computer-Vision-Docker-Workspace

Docker compose with custom DockerFile for Data Science and Computer Vision purposes with Jupyter notebook.

 ![](https://i.pinimg.com/originals/7f/dd/e7/7fdde7d65373c3bdc68ff29bd843e927.gif)
 
 # Next steps for AWS GPU Instances and Local GPU
 
- [x] OpenCV + Tensorflow (done) - tags 0.1
- [ ] Plotly - tags 0.2
- [ ] NVIDIA Container Toolkit - tags nvidia_toolkit
- [ ] CUDA - tags nvidia_toolkit
- [ ] Detectron2 - tags detectron2
- [ ] YoloV5 - tags yolo5

# List of libreries

* cython
* numpy
* pandas
* matplotlib
* lxml
* tensorflow
* opencv-contrib-python
* scikit-learn

## Documentation

Topic | Documentation
------------ | -------------
Docker | https://docs.docker.com/get-docker/
Numpy | https://numpy.org/
Pandas | https://pandas.pydata.org/
Matplotlib | https://matplotlib.org/
Tensorflow| https://www.tensorflow.org/
Scikit-learn | https://scikit-learn.org/

# Usage

    https://localhost:8080/tree
    
![](https://i.imgur.com/eO5WFxz.png)

## Start

    docker-compose up -d
## Stop

    docker-compose down
## or
    docker container stop [name_container]

# Credentials

## How envs variable is define inside the docker-compose.yml
```yml
environment:
    - JUPYTER_TOKEN=easy
    - PASSWORD=password
```
## Password

    PASSWORD=password

## ACCESS_TOKEN

    JUPYTER_TOKEN=easy

## Volumes

```yml
volumes:
   - jupyter-work:/home/jovyan/work
   - jupyter-datasets:/home/jovyan/work/datasets
   - jupyter-modules:/home/jovyan/work/modules
   - jupyter-notebook:/etc/ssl/notebook
```
