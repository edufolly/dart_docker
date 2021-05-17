FROM subfuzion/dart:slim

WORKDIR /app

ADD ./bin/main.exe main
# RUN chmod +x main

EXPOSE 8080

ENTRYPOINT [ "./main" ]