import 'package:test/test.dart';
import 'package:spoo_me_api/spoo_me_api.dart';

void main() {
  group('ShortUrlResponse', () {
    group(
      'fromJson',
      () {
        test(
            'should parses JSON map into ShortUrlResponse instance with correct properties',
            () {
          final shortUrl = ShortUrlResponse.fromJson(
              {'short_url': 'https://www.utrodus.com'});
          expect(shortUrl, isA<ShortUrlResponse>());
          expect(shortUrl.url, equals('https://www.utrodus.com'));
        });

        test(
            'should return url property with an empty value when url value from json is empty',
            () {
          final shortUrl = ShortUrlResponse.fromJson({'short_url': ''});
          expect(shortUrl.url, isEmpty);
        });

        test('should throw an error when all key is missing in JSON data', () {
          expect(
              () => ShortUrlResponse.fromJson({}), throwsA(isA<TypeError>()));
        });
      },
    );
  });
}
