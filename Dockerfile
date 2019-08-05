#name of image to inherit from
FROM python:3.8-rc

#maintainer of the app
MAINTAINER Fredrick Troas Lutterodt

#setup python unbuffered environment variable
ENV PYTHONUNBUFFERED 1

#copy requirements file
COPY ./requirements.txt  /requirements.txt

#run packages installation
RUN pip install -r /requirements.txt

#create empty folder on docker image called app
RUN mkdir /app

#switch to the app as the default working directory
WORKDIR /app

#copy from local machine app folder to app folder on docker image
COPY ./app /app

#create a user that will run our application using docker
RUN adduser --disabled-login user

#switch to the user called user
USER user
