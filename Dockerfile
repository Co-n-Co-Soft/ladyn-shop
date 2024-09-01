FROM node:22 AS build

COPY . /opt/app

WORKDIR /opt/app
RUN yarn install
RUN yarn build
