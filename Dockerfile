FROM node:16-alpine

RUN apk update

WORKDIR /app
COPY . .

RUN echo "SESSION_SECRET=abc123" >> .env
RUN npm config set registry https://registry.npmmirror.com
RUN npm install
RUN npm run build

EXPOSE 8787
ENTRYPOINT ["npm", "start"]
