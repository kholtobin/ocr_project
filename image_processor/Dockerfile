FROM ruby:3.1.2

RUN apt-get update && apt-get install -y netcat -qq && apt-get install --yes tesseract-ocr
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp
