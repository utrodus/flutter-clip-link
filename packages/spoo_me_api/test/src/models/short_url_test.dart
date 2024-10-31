import 'package:test/test.dart';
import 'package:spoo_me_api/spoo_me_api.dart';

void main() {
  group('ShortUrl', () {
    group(
      'fromJson',
      () {
        test(
            'should parses JSON map into ShortUrl instance with correct properties',
            () {
          final shortUrl =
              ShortUrl.fromJson({'short_url': 'https://www.utrodus.com'});
          expect(shortUrl, isA<ShortUrl>());
          expect(shortUrl.url, equals('https://www.utrodus.com'));
        });

        test(
            'should return url property with an empty value when url value from json is empty',
            () {
          final shortUrl = ShortUrl.fromJson({'short_url': ''});
          expect(shortUrl.url, isEmpty);
        });

        test('should throw an error when all key is missing in JSON data', () {
          expect(() => ShortUrl.fromJson({}), throwsA(isA<TypeError>()));
        });
      },
    );
  });
}
