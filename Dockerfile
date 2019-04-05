FROM jekyll/builder

WORKDIR /srv/jekyll

RUN bundle config --global frozen 1
RUN apk add imagemagick6 imagemagick6-dev

COPY Gemfile Gemfile.lock ./
RUN bundle install


CMD ["jekyll", "--help"]
ENTRYPOINT ["/usr/jekyll/bin/entrypoint"]
VOLUME  /srv/jekyll
EXPOSE 35729
EXPOSE 4000
