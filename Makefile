#.PHONY:

# DOCKER IMAGE REGISTRY
REGISTRY ?= docker.io
IMAGE_NAME ?= template
IMAGE_TAG ?= latest

PIP_INDEX = https://mirrors.aliyun.com/pypi/simple/

local-install:
	pip install --upgrade --index-url ${PIP_INDEX} pip
	pip install --index-url ${PIP_INDEX} -r requirements/local.txt

docker-build:
	docker build -t ${REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG} .

docker-push:
	docker push ${REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}

makemigrations:
	python manage.py makemigrations

migrate:
	python manage.py migrate

makemessages:
	python manage.py makemessages -l zh_Hans

compilemessages:
	python manage.py compilemessages

run:
	python manage.py runserver
