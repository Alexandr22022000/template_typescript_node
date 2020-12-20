# Parent containers
FROM node:15
FROM zol22222/template-react

# Copy files to generate node_modules
COPY package.json /app/
COPY yarn.lock /app/

# Copy files to generate build
COPY tsconfig.json /app/
COPY src /app/src/

# Switch to app directory
WORKDIR /app

# Migrate frontend build to public directory
RUN mkdir public
RUN cp -R build/* public/
RUN rm -rf build

# Generate build
RUN yarn --silent
RUN yarn build

# Clean up src
RUN rm -rf tsconfig.json
RUN rm -rf src
RUN rm -rf yarn.lock

# Generate production node_modules
RUN rm -rf node_modules
RUN yarn --prod --silent
RUN rm -rf yarn.lock

# Run
EXPOSE 5000
CMD yarn prod
