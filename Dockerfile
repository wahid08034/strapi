FROM node:18-alpine

RUN apk add --no-cache python3 make g++

WORKDIR /app

RUN corepack enable

COPY . .

RUN yarn install

# Build all monorepo packages (important!)
RUN yarn build

WORKDIR /app/examples/getstarted

RUN yarn build

EXPOSE 1337

CMD ["yarn", "start"]