FROM node:alpine3.10

LABEL NAME="vasylkosiv/simple-node-server"
LABEL VERSION="0.0.1"
LABEL MAINTAINER="VasCos"

ENV HOST="0.0.0.0"
ENV PORT="3000"

WORKDIR /src
COPY . .

RUN npm i --no-cache

EXPOSE 3000

ENTRYPOINT [ "npm", "run" ]
CMD [ "start" ]