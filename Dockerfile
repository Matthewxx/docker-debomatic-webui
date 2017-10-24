FROM debian:stable
RUN apt-get update && apt-get install -y debomatic npm nodejs nodejs-legacy
RUN 
