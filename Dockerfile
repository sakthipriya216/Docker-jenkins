FROM alpine

#WORKDIR /etc
RUN apk update
RUN apk add nginx openrc
RUN openrc
RUN touch /run/openrc/softlevel
# RUN 'apk update && \
#     apk add nginx openrc && \
#     openrc && \
#     touch /run/openrc/softlevel '

COPY default.conf /etc/nginx/http.d

#ENTRYPOINT [ "rc-service", "nginx", "start" ]
CMD ["nginx", "-g", "daemon off;"]
