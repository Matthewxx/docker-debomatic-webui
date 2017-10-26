FROM debian:stable
RUN apt-get update && apt-get install -y curl gnupg git
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs
RUN git clone https://github.com/debomatic/debomatic-webui.git
WORKDIR /debomatic-webui/debomatic-webui
RUN mkdir -p /usr/share/debomatic/modules
RUN ln -s `pwd`/debomatic-modules/JSONLogger.py /usr/share/debomatic/modules/JSONLoggerStart.py
RUN ln -s `pwd`/debomatic-modules/JSONLogger.py /usr/share/debomatic/modules/JSONLoggerStop.py
RUN npm install --unsafe-perm
RUN npm install -g coffee-script
ADD user.config user.config
RUN mkdir -p /srv/debomatic/amd64
ADD debomatic-webui.sh debomatic-webui.sh
CMD ./debomatic-webui.sh
