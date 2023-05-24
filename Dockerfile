FROM ubuntu:18.04


WORKDIR /rubyinstall

RUN apt-get update && apt-get install wget -y && apt-get install cmake -y
RUN wget https://github.com/postmodern/ruby-install/releases/download/v0.9.0/ruby-install-0.9.0.tar.gz && tar -xzvf ruby-install-0.9.0.tar.gz && cd ruby-install-0.9.0 && make install && ./setup.sh

RUN ruby-install 2.7.8

RUN wget https://github.com/postmodern/chruby/releases/download/v0.3.9/chruby-0.3.9.tar.gz && tar -xzvf chruby-0.3.9.tar.gz && cd chruby-0.3.9/ && make install && ./scripts/setup.sh

WORKDIR /root
RUN echo "source /usr/local/share/chruby/chruby.sh" >> /root/.bashrc
RUN echo "chruby 2.7.8" >> /root/.profile

RUN apt-get install git -y
# to build ruby mysql client
RUN apt-get install libmysqlclient-dev -y

# gem install mysql2 -v '0.5.3' --source 'https://rubygems.org/'

# to build ruby pg client
RUN apt-get install libpq-dev -y
RUN apt-get install zip lsof -y

SHELL ["/bin/bash", "-c", "source /usr/local/share/chruby/chruby.sh && chruby 2.7.8 && gem install mysql2 -v '0.5.3' --source 'https://rubygems.org/' && gem install pg -v '1.2.3' --source 'https://rubygems.org/'"]

# gem install pg -v '1.2.3' --source 'https://rubygems.org/'

# maybe gem install bundler for postgres client
RUN apt-get install postgresql-client -y
