# Pull base image.
FROM ubuntu:16.04

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget nodejs-legacy npm && \
  npm -v && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY . .

RUN \
  npm config set strict-ssl false && \
  npm install

EXPOSE 8080

# Define default command.
CMD ["npm", "start"]