FROM node:22-alpine as build

WORKDIR /opt
# RUN --mount=type=bind,target=package.json,source=package.json \
    # yarn install
    # npm install --loglevel verbose
# COPY package.json package.json
COPY package.json package.json
COPY yarn.lock yarn.lock
RUN yarn install
# RUN npm install --loglevel verbose
# RUN cat package.json
# RUN yarn install -v

FROM node:22-alpine as main
RUN apk add curl
# ADD . /usr/src/app

# COPY . /usr/src/app
WORKDIR /usr/src/app
# RUN yarn install --check-files -v
COPY --from=build /opt/node_modules /usr/src/app/node_modules
