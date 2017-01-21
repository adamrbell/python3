FROM python:3.6
MAINTAINER Me <because.it.needs.atleast.1.arg>

VOLUME /config
VOLUME /code

ENV TERM=xterm

# Install from pip
RUN pip3 install --no-cache-dir sanic django

# Install utils
RUN apt-get update && \ 
apt-get install -y \
software-properties-common \
python-software-properties \
nano \
curl

# Add libav ppa and install
RUN add-apt-repository ppa:heyarje/libav-11 -y && \
apt-get update && \ 
apt-get install -y \
libav-tools

# Install youtube-DL
RUN curl -L https://yt-dl.org/latest/youtube-dl -o /usr/local/bin/youtube-dl
RUN chmod a+rx /usr/local/bin/youtube-dl

# Make my life easier
RUN echo "alias youtube-dl='/usr/local/bin/youtube-dl'" >> ~/.bash_aliases

# clean up
RUN apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD [ "python", "/code/test.py" ]
