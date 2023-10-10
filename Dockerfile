FROM python:3.9

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./todoapp /app
WORKDIR /app
EXPOSE 8000

# need it for mysqlclient installation
RUN apt-get update && apt-get install -y \
    default-libmysqlclient-dev

RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install --no-cache-dir   -r /tmp/requirements.txt && \
    rm -rf /tmp

ENV PATH="/py/bin:$PATH"

#RUN python manage.py makemigrations && \
#        python manage.py migrate
#CMD ["python","manage.py","runserver","0.0.0.0:8000"]
