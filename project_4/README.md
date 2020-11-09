CircleCI build status: [![CircleCI](https://circleci.com/gh/weichiet/Operationalize-a-Machine-Learning-Microservice-API.svg?style=svg)](https://circleci.com/gh/weichiet/Operationalize-a-Machine-Learning-Microservice-API)

# Operationalize a Machine Learning Microservice API

## Project Overview

In this project, a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios is given. The objective of this project is to operationalize a Python flask app that serves out predictions (inference) about housing prices through API calls.

## Project Tasks

The project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. The tasks include:
* Test the project code using linting
* Complete a Dockerfile to containerize this application
* Deploy the containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that the code has been tested

The detailed project tasks can be found [here](./Create_the_Project_Environment.md).  

## Getting Started
### Setup the Environment

* Follow the steps in this [page](./Create_the_Project_Environment.md) to create the project environment.  
* Create a virtualenv and activate it
``` shell
python3 -m venv <your_venv>
source <your_venv>/bin/activate
```

* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Kubernetes Steps

* Setup and Configure Docker locally
* Setup and Configure Kubernetes locally
* Create Flask app in Container
* Run via `kubectl`

### Description of the Project Files
- `.circleci`: Directory that contains the `yaml` configuration file that defines the [CircleCI Pipeline](https://circleci.com/)
-	`/model_data`: Directory that contains the housing data and pre-trained model
- `/output_txt_files`: Log data output required for this assignment
- `Dockerfile`: Used to build the containerized version of the application
-	`Makefile`: Used to automate project setup and linting
-	`app.py`: Python code that uses the pre-trained model in `model_data` to predict housing prices
- `make_prediction.sh`: Script used to invoke the containerized prediction application via the appropriate port
-	`requirements.txt`: Defined the required project dependencies
-	`run_docker.sh`: Script that builds and starts the project as a docker container
-	`run_kubernetes.sh`: Script that deploys this projects docker container to a local Kubernetes cluster
- `upload_docker.sh`: Script that uploads the locally build docker image to [Docker Hub](https://hub.docker.com/).
