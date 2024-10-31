import 'package:test/test.dart';
import 'package:spoo_me_api/spoo_me_api.dart';

void main() {
  group(
    'UrlStatistics',
    () {
      group('fromJson', () {
        test(
            'should parses JSON map into UrlStatistics instance with correct properties',
            () {
          final urlStatistics = UrlStatistics.fromJson({
            "_id": "dSP9do",
            "short_code": "dSP9do",
            "total-clicks": 1,
            "creation-date": "2024-10-28",
            "last-click": "2024-10-28 17:17:45",
            "last-click-browser": "Chrome",
            "last-click-os": "Linux",
            "average_redirection_time": 1.33,
            "url": "https://www.google.com",
            "password": null
          });
          expect(urlStatistics, isA<UrlStatistics>());
          expect(urlStatistics.shortCode, equals('dSP9do'));
          expect(urlStatistics.totalClicks, equals(1));
          expect(urlStatistics.creationDate, equals('2024-10-28'));
          expect(urlStatistics.lastClickDate, equals('2024-10-28 17:17:45'));
          expect(urlStatistics.lastClickBrowser, equals('Chrome'));
          expect(urlStatistics.lastClickOS, equals('Linux'));
          expect(urlStatistics.averageRedirectionTime, equals(1.33));
          expect(urlStatistics.originalUrl, equals('https://www.google.com'));
          expect(urlStatistics.password, isNull);
        });

        test('should throw an error when all key is missing in JSON data', () {
          expect(() => UrlStatistics.fromJson({}), throwsA(isA<TypeError>()));
        });
      });
    },
  );
}
