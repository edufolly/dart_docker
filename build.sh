# /bin/bash

set -x

rm -f bin/main.exe

docker run --name dart_compile -v $(pwd):/app -t -d google/dart

docker exec dart_compile dart compile exe /app/bin/main.dart

docker stop dart_compile

docker rm dart_compile

docker build -t dart_native .

set +x