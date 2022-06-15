import 'package:http/http.dart';
import 'package:test/test.dart';
import 'package:test_process/test_process.dart';

void main() {
  final port = '8080';
  final host = 'http://127.0.0.1:$port';

  setUp(() async {
    await TestProcess.start(
      'dart',
      ['run', 'bin/server.dart'],
      environment: {'PORT': port},
    );
    await Future.delayed(const Duration(seconds: 2));
  });

  tearDown(() => print('teardown!'));

  // test('Root', () async {
  //   final response = await get(Uri.parse(host + '/'));
  //   expect(response.statusCode, 200);
  //   expect(response.body, 'Hello, World!\n');
  // });

  // test('Echo', () async {
  //   final response = await get(Uri.parse(host + '/echo/hello'));
  //   expect(response.statusCode, 200);
  //   expect(response.body, 'hello\n');
  // });
  test('404', () async {
    final response = await get(Uri.parse(host + '/foobar'));
    expect(response.statusCode, 404);
  });
}
