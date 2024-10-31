import 'package:spoo_me_api/spoo_me_api.dart';
import 'package:test/test.dart';

void main() {
  group(
    'ShortUrlParam',
    () {
      group('toJson', () {
        test('should return correct JSON representation of ShortUrlParam', () {
          expect(
            ShortUrlParam(
              url: 'https://www.utrodus.com',
              alias: 'utrodus',
              password: '123456',
            ).toJson(),
            <String, dynamic>{
              'url': 'https://www.utrodus.com',
              'alias': 'utrodus',
              'password': '123456',
            },
          );
        });
      });
    },
  );
}
