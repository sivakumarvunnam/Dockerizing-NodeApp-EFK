FROM node:10.16.0-alpine

MAINTAINER Sivakumar Vunnam <sivakumar.vunnam@bhnetwork.com>

WORKDIR /Applogging

# copy app dependencies
COPY ./package*.json /Applogging/

# RUN npm install
RUN cd /Applogging && npm install

# Bundle app source
COPY . .

EXPOSE 3000

CMD ["sh", "-c", "npm start"]
