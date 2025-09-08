# docker/Dockerfile
FROM node:22-alpine

WORKDIR /workdir

RUN apk add --no-cache git bash openssh-client

# package.json と lockファイルを先にコピー
COPY package*.json ./
RUN npm ci

# ソースコードを最後にコピー
COPY . .

EXPOSE 8000
ENTRYPOINT ["sh", "docker/entrypoint.sh"]
