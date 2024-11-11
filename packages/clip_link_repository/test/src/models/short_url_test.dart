import 'package:spoo_me_api/spoo_me_api.dart';
import 'package:test/test.dart';
import 'package:clip_link_repository/clip_link_repository.dart';

void main() {
  group('ShortUrlModel', () {
    test(
      'should be able to convert ShortUrlResponse to model',
      () {
        final shortUrlResponse = ShortUrlResponse(url: 'https://example.com');
        final shortUrlModel = ShortUrlModel.toModel(shortUrlResponse);
        expect(shortUrlModel.shortUrl, 'https://example.com');
        expect(shortUrlModel.shortUrl, shortUrlResponse.url);
      },
    );
  });
}
