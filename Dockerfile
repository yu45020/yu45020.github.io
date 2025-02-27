FROM ruby:3.4.2-bookworm AS dev
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    bash \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

FROM dev AS ci
ENV JEKYLL_ENV=development
COPY Gemfile jekyll-theme-chirpy.gemspec   ./
RUN bundle install && bundle update
COPY . ./
