FROM alpine:3.20
RUN apk add --no-cache curl unzip
RUN curl -L -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/download/v25.10.15/Xray-linux-64.zip && unzip /tmp/xray.zip -d /usr/local/bin/ && chmod +x /usr/local/bin/xray && rm /tmp/xray.zip
COPY entrypoint.sh /entrypoint.sh
COPY config-template.json /config-template.json
RUN chmod +x /entrypoint.sh
EXPOSE 8080
ENTRYPOINT ["/entrypoint.sh"]
