FROM python:3.6
MAINTAINER Me <because.it.needs.atleast.1.arg>

VOLUME /config
VOLUME /code

ENV TERM=xterm

# install from pip
RUN pip3 install --no-cache-dir sanic django

# install utils
RUN add-apt-repository ppa:heyarje/libav-11 -y && \
apt-get update && \ 
apt-get install -y \
nano \
libav-tools \
curl

# Install youtube-DL
RUN curl -L https://yt-dl.org/latest/youtube-dl -o /usr/local/bin/youtube-dl
RUN chmod a+rx /usr/local/bin/youtube-dl

# Make my life easier
RUN echo "alias youtube-dl='/usr/local/bin/youtube-dl'" >> ~/.bash_aliases

# clean up
RUN apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD [ "python", "/code/test.py" ]
