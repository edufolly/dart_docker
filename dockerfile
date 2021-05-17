FROM google/dart AS dart

WORKDIR /app

ADD pubspec.* /app/
RUN pub get
ADD . /app
RUN pub get --offline

RUN dart compile exe bin/main.dart

FROM subfuzion/dart:slim

COPY --from=dart /app/bin/main.exe /main

CMD []
ENTRYPOINT [ "./main" ]

EXPOSE 8080
