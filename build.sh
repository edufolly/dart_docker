# /bin/bash
set -x

docker rm -f main

docker build -t dart_native .

docker run --name main -p 8080:8080 -d dart_native

curl http://localhost:8080/

set +x