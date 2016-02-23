FROM java:8

MAINTAINER Fabrizio Di Napoli

ENV SBT_VERSION 0.13.9
ENV NODEJS_VERSION 5.x

# Install sbt
RUN \
  curl -L --insecure -o sbt-$SBT_VERSION.deb https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update && \
  apt-get install sbt

# install ruby
RUN apt-get install -y ruby-full

# install our dependencies and nodejs
RUN curl -sL https://deb.nodesource.com/setup_$NODEJS_VERSION | bash -
RUN apt-get install -y nodejs

# Install npm
RUN curl -L --insecure -o install.sh http://npmjs.org/install.sh && sh install.sh

# Install sass
RUN gem install sass
