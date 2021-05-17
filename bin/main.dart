import 'dart:io';

// import 'package:http/http.dart';
import 'package:path/path.dart' as p;

///
///
///
void main(List<String> arguments) {
  HttpServer.bind(InternetAddress.anyIPv4, 8080).then((HttpServer server) {
    server.listen((HttpRequest request) async {
      request.response.write('Hello World - ${p.current} - ${DateTime.now()}');

      // Response response =
      //     await get(Uri.parse('https://api64.ipify.org?format=json'));

      // request.response.write(response.body);

      await request.response.close();
    });
  });
}
