FROM nginx
LABEL maintainer="jahnavi"
WORKDIR /usr/share/nginx/html
EXPOSE 90
CMD ["nginx", "-g", "daemon off;"]

