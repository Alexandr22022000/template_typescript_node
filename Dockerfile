FROM node:15
FROM zol22222/template-react

COPY package.json /app/
COPY yarn.lock /app/

COPY tsconfig.json /app/
COPY src /app/src/
WORKDIR /app

RUN mkdir public
RUN cp -R build/* public/
RUN rm -rf build

RUN yarn --silent

RUN yarn build

RUN rm -rf tsconfig.json
RUN rm -rf src
RUN rm -rf yarn.lock

RUN rm -rf node_modules
RUN yarn --prod --silent
RUN rm -rf yarn.lock

EXPOSE 5000
CMD yarn prod
