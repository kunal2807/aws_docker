FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm i
COPY . .
RUN npm run build
# Now I have my build file as production
# only fucking stuff i cared about

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# copy from builder phase the folder /app/build
# to specified path