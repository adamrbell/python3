FROM python:3.5.2
MAINTAINER Me <because.it.needs.atleast.1.arg>

VOLUME /config
VOLUME /code

RUN pip3 install --no-cache-dir sanic

CMD [ "python", "/code/test.py" ]
