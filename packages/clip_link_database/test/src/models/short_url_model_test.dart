import 'package:test/test.dart';

import 'package:clip_link_database/clip_link_database.dart';

void main() {
  group('ShortUrlModel', () {
    test('should create an instance with the correct values', () {
      const shortUrl = ShortUrlModel(
        id: 1,
        shortCode: 'abc123',
        originalUrl: 'https://example.com',
        shortenedUrl: 'https://short.ly/abc123',
        isHavePassword: true,
        isFavorited: false,
        password: 'secret',
      );

      expect(shortUrl.id, 1);
      expect(shortUrl.shortCode, 'abc123');
      expect(shortUrl.originalUrl, 'https://example.com');
      expect(shortUrl.shortenedUrl, 'https://short.ly/abc123');
      expect(shortUrl.isHavePassword, true);
      expect(shortUrl.isFavorited, false);
      expect(shortUrl.password, 'secret');
    });

    test('should allow password to be null', () {
      const shortUrl = ShortUrlModel(
        id: 2,
        shortCode: 'xyz789',
        originalUrl: 'https://another.com',
        shortenedUrl: 'https://short.ly/xyz789',
        isHavePassword: false,
        isFavorited: true,
      );

      expect(shortUrl.id, 2);
      expect(shortUrl.shortCode, 'xyz789');
      expect(shortUrl.originalUrl, 'https://another.com');
      expect(shortUrl.shortenedUrl, 'https://short.ly/xyz789');
      expect(shortUrl.isHavePassword, false);
      expect(shortUrl.isFavorited, true);
      expect(shortUrl.password, isNull);
    });

    test('should consider instances with the same values as equal', () {
      const shortUrl1 = ShortUrlModel(
        id: 3,
        shortCode: 'qwe456',
        originalUrl: 'https://example.org',
        shortenedUrl: 'https://short.ly/qwe456',
        isHavePassword: false,
        isFavorited: true,
      );

      const shortUrl2 = ShortUrlModel(
        id: 3,
        shortCode: 'qwe456',
        originalUrl: 'https://example.org',
        shortenedUrl: 'https://short.ly/qwe456',
        isHavePassword: false,
        isFavorited: true,
      );

      expect(shortUrl1, equals(shortUrl2));
    });
  });
}
