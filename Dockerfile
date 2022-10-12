FROM nginx
LABEL maintainer="jahnavi"
WORKDIR /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

