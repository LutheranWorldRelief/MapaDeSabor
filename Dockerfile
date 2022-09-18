FROM ruby:2.4.0

RUN apt-get update -y && apt-get install -y apt-transport-https
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - 
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
 

RUN apt-get update -y && apt-get install -y wget && \ 
    apt-get install -y yarn && \ 
    apt-get install -y wkhtmltopdf && \  
    apt-get install -y nodejs && \ 
    apt-get install -y postgresql-client

RUN mkdir /app
RUN mkdir -p /unicorn/pids
RUN mkdir -p /unicorn/sockets
RUN mkdir -p /unicorn/log
RUN mkdir /tmp/rails-app

# configuring git to use "https://" instead of "git://" protocol
RUN git config --global url."https://".insteadOf git://

WORKDIR /app

COPY Gemfile /app/Gemfile
# COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["tail", "-f", "/dev/null"]