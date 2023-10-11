FROM python:3.9-alpine3.13

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./todoapp /app
COPY ./scripts /scripts

WORKDIR /app
EXPOSE 8000

#need it for mysqlclient installation
# RUN apt-get update && apt-get install -y \
#     default-libmysqlclient-dev

RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    apk add --update --no-cache --virtual .tmp-build-deps && \
            default-libmysqlclient-dev linux-headers && \
    /py/bin/pip install --no-cache-dir   -r /tmp/requirements.txt && \
    rm -rf /tmp && \
    apk del .tmp-build-deps
    
ENV PATH="/py/bin:$PATH"


