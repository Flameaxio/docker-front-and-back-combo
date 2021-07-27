FROM ruby:2.5.1
# Install DB
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y sqlite3 libsqlite3-dev

RUN apt-get install -y nodejs

WORKDIR ./
COPY Gemfile /Gemfile
COPY Gemfile.lock /Gemfile.lock
ENV BUNDLER_VERSION=2.2.22
RUN gem update --system && gem install bundler -v 2.2.22 && bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
COPY . .
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
