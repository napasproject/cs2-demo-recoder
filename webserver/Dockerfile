FROM node:alpine

WORKDIR /app

ENV DEMOS_DAYS_OR_COUNT=500
ENV DEMOS_CLEAN_TYPE=count
ENV DEMOS_TIME_CLEAR=60
ENV DEMOS_UPLOAD_DIR=/demos

COPY . .

RUN apk add jq
RUN npm install
RUN chmod +x run.sh

ENTRYPOINT [ "./run.sh" ]