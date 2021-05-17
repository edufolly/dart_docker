# /bin/bash
set +e
set -x

docker rm -f main

rm -f bin/main.exe

#####

mkdir -p build/bin/
cp -Rf bin/ build/bin/
cp -f *.yaml build/

#####

docker run --name dart_compile -v $(pwd)/build:/app -t -d google/dart

docker exec -w /app dart_compile dart pub get

docker exec dart_compile dart compile exe /app/bin/main.dart

docker stop dart_compile

docker rm dart_compile

#####

cp build/bin/main.exe bin/main.exe
rm -rf build

#####

docker build -t dart_native .

#####

docker run --name main -p 8080:8080 -d dart_native

curl http://localhost:8080/

set +x