#build the Docker from existing image, with alpine (very tiny linux)
FROM tiangolo/uwsgi-nginx-flask:python3.8-alpine
#install bash command processor and the nano editor, and also git client
RUN apk --update add bash nano
RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev \
    && apk add --no-cache mariadb-dev
#environment variable specific to the Docker image
ENV STATIC_URL /static
#define static folder
ENV STATIC_PATH /var/www/app/static
#copy requirements.txt into the container, so it may be executed
COPY ./requirements.txt /var/www/requirements.txt
#runs instalations of the specified dependencies from the requirements.txt
RUN pip install -r /var/www/requirements.txt