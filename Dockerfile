FROM ruby:2.7-alpine

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

RUN apk add --no-cache build-base gcc bash cmake git
RUN gem install bundler jekyll

WORKDIR /Desktop/myblog


COPY . .
COPY Gemfile Gemfile.lock ./
RUN bundle install

CMD [ "bundle", "exec", "jekyll", "serve", "-H", "0.0.0.0" ]
