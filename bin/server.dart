import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_static/shelf_static.dart';

void main() {
  final _handler = Pipeline().addMiddleware(logRequests()).addHandler(
        createStaticHandler(
          'example/files',
          defaultDocument: 'index.html',
        ),
      );

  io.serve(_handler, 'localhost', 8080);
}
