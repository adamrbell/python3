FROM python:3.5.2
MAINTAINER 

VOLUME /config
VOLUME /code

RUN pip3 install --no-cache-dir sanic

CMD [ "python", "/code/test.py" ]
