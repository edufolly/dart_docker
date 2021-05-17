FROM debian:buster

WORKDIR /app

ADD ./bin/main.exe main
RUN chmod +x main

EXPOSE 8080

ENTRYPOINT [ "./main" ]