FROM node:alpine3.12

ENV PORT=80
ENV HOST=0.0.0.0

WORKDIR /app

COPY . .
RUN apk update && apk add curl
RUN npm i --no-cache

HEALTHCHECK --interval=5s --timeout=3s --start-period=3s --retries=3 CMD [ "ping", "0.0.0.0/ping" ]

ENTRYPOINT [ "npm", "run" ]
CMD [ "start" ]



