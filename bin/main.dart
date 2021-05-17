import 'dart:io';

///
///
///
void main(List<String> arguments) {
  HttpServer.bind(InternetAddress.anyIPv4, 8080).then((HttpServer server) {
    server.listen((HttpRequest request) {
      request.response.write('Olá Mundo.');
      request.response.close();
    });
  });
}
