# devops-capstone

## Contents

This repository contains:

- The hello.py Flask App, based on the Flasky app taken from the Miguel Grinberg Flask Web Development.
- Dockerfile for generating the Image jjahs/capstone
- A config.yml for setting up the Pipeline in CircleCI
- Some .sh files for local testing, based on Udacity's 5th Unit material

## Following the Rubric

### Set up the Pipeline:

1. There is an Python application (hello.py) which gets set up into an image which is then tested locally in a Docker Container
2. The built Image is pushed to Dockerhub, at jjahs/capstone

### Build Docker Container:

3. Code is checked against two linters: Hadolint and Pylint:

![Picture 1](http://udacity-website-jjahs.s3-website-us-east-1.amazonaws.com/img/Picture1.jpg)

![Picture 2](http://udacity-website-jjahs.s3-website-us-east-1.amazonaws.com/img/Picture2.jpg)

4. The project is copied from Github to CircleCI, built into an image and sent to Dockerhub

### Successful Deployment

5. The application is deployed using both Cloudformation and Ansible, using the tools set up in the eks folder.
