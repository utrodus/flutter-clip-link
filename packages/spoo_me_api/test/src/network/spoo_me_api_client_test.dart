// ignore_for_file: empty_catches, avoid_print

import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:spoo_me_api/spoo_me_api.dart';
import 'package:test/test.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

class FakeUri extends Fake implements Uri {}

void main() {
  group('SpooMeAPIClient', () {
    late http.Client httpClient;
    late SpooMeApiClient spooMeApiClient;

    setUpAll(() {
      registerFallbackValue(FakeUri());
    });

    setUp(() {
      httpClient = MockHttpClient();
      spooMeApiClient = SpooMeApiClient(httpClient: httpClient);
    });

    group('constructor', () {
      test('does not require an httpClient', () {
        expect(SpooMeApiClient(), isNotNull);
      });
    });

    group('generateShortUrl', () {
      ShortUrlParam mockShortUrlParam =
          ShortUrlParam(url: 'https://example.com');
      final mockResponse = MockResponse();
      final mockHeaders = {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded'
      };

      test('makes correct http request generate short url', () async {
        when(() => mockResponse.statusCode).thenReturn(200);
        when(() => mockResponse.body).thenReturn('{}');
        when(() => httpClient.post(any()))
            .thenAnswer((_) async => mockResponse);
        try {
          await spooMeApiClient.generateShortUrl(param: mockShortUrlParam);
        } catch (e) {}
        verify(
          () => httpClient.post(
            Uri.parse(ApiEndpoints.baseUrl),
            headers: mockHeaders,
            body: mockShortUrlParam.toJson(),
          ),
        ).called(1);
      });

      test(
        'throw InvalidUrlRequestFailure when error name is "UrlError" and status code is 400',
        () async {
          when(() => mockResponse.statusCode).thenReturn(400);
          when(() => mockResponse.body)
              .thenReturn('{"UrlError": "Error Message"}');
          when(() => httpClient.post(
                any(),
                headers: mockHeaders,
                body: any(named: "body"),
              )).thenAnswer((_) async => mockResponse);

          expect(
            () => spooMeApiClient.generateShortUrl(param: mockShortUrlParam),
            throwsA(isA<InvalidUrlRequestFailure>()),
          );
        },
      );

      test(
        'throw AliasRequestFailure when error name is "AliasError" and status code is 400',
        () async {
          when(() => mockResponse.statusCode).thenReturn(400);
          when(() => mockResponse.body)
              .thenReturn('{"AliasError": "Error Message"}');
          when(() => httpClient.post(
                any(),
                headers: mockHeaders,
                body: any(named: "body"),
              )).thenAnswer((_) async => mockResponse);

          expect(
            () => spooMeApiClient.generateShortUrl(param: mockShortUrlParam),
            throwsA(isA<AliasRequestFailure>()),
          );
        },
      );

      test(
        'throw PasswordInvalidRequestFailure when error name is "PasswordError" and status code is 400',
        () async {
          when(() => mockResponse.statusCode).thenReturn(400);
          when(() => mockResponse.body)
              .thenReturn('{"PasswordError": "Error Message"}');
          when(() => httpClient.post(
                any(),
                headers: mockHeaders,
                body: any(named: "body"),
              )).thenAnswer((_) async => mockResponse);

          expect(
            () => spooMeApiClient.generateShortUrl(param: mockShortUrlParam),
            throwsA(isA<PasswordInvalidRequestFailure>()),
          );
        },
      );

      test('throw Exception with "Unexpected error" message for unknown error',
          () async {
        // Arrange
        when(() => mockResponse.statusCode).thenReturn(200);
        // Simulate invalid JSON to trigger an unexpected error
        when(() => mockResponse.body).thenReturn('Invalid JSON response');
        when(() => httpClient.post(
              any(),
              headers: any(named: 'headers'),
              body: any(named: "body"),
            )).thenAnswer((_) async => mockResponse);

        // Act & Assert
        expect(
          () => spooMeApiClient.generateShortUrl(param: mockShortUrlParam),
          throwsA(predicate((e) =>
              e is Exception && e.toString().contains('Unexpected error'))),
        );
      });

      test(
          'should return ShortUrlResponse instance with correct value when status code is 200',
          () async {
        when(() => mockResponse.statusCode).thenReturn(200);
        when(() => mockResponse.body)
            .thenReturn('{"short_url": "https://spoo.me/TdrWjy"}');
        when(() => httpClient.post(
              any(),
              headers: mockHeaders,
              body: any(named: "body"),
            )).thenAnswer((_) async => mockResponse);
        final actual =
            await spooMeApiClient.generateShortUrl(param: mockShortUrlParam);
        expect(
            actual,
            isA<ShortUrlResponse>().having(
                (value) => value.url, 'short_url', 'https://spoo.me/TdrWjy'));
      });
    });

    group('getUrlStatistics', () {
      final mockResponse = MockResponse();
      final mockHeaders = {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded'
      };
      const mockShortCode = 'asdfasd';
      const mockPassword = 'password';
      final mockRequestBody = {'password': mockPassword};

      test('makes correct http request for get url statistics', () async {
        when(() => mockResponse.statusCode).thenReturn(200);
        when(() => mockResponse.body).thenReturn('{}');
        when(() => httpClient.post(
              any(),
              headers: mockHeaders,
              body: mockRequestBody,
            )).thenAnswer((_) async => mockResponse);
        try {
          await spooMeApiClient.getUrlStatistics(
            shortCode: mockShortCode,
            password: mockPassword,
          );
        } catch (e) {}
        verify(
          () => httpClient.post(
            Uri.parse(
                "${ApiEndpoints.baseUrl}/${ApiEndpoints.urlStatistics}/$mockShortCode"),
            headers: mockHeaders,
            body: mockRequestBody,
          ),
        ).called(1);
      });
      test(
        'throw UrlNotFoundRequestFailure when error name is "UrlError and status code is 404"',
        () async {
          when(() => mockResponse.statusCode).thenReturn(404);
          when(() => mockResponse.body)
              .thenReturn('{"UrlError": "Error Message"}');
          when(() => httpClient.post(
                any(),
                headers: mockHeaders,
                body: mockRequestBody,
              )).thenAnswer((_) async => mockResponse);

          expect(
            () => spooMeApiClient.getUrlStatistics(
              shortCode: mockShortCode,
              password: mockPassword,
            ),
            throwsA(isA<UrlNotFoundRequestFailure>()),
          );
        },
      );

      test(
        'throw WrongPasswordFailure when error name is "UrlError and status code is 404"',
        () async {
          when(() => mockResponse.statusCode).thenReturn(400);
          when(() => mockResponse.body)
              .thenReturn('{"PasswordError": "Error Message"}');
          when(() => httpClient.post(
                any(),
                headers: mockHeaders,
                body: mockRequestBody,
              )).thenAnswer((_) async => mockResponse);

          expect(
            () => spooMeApiClient.getUrlStatistics(
              shortCode: mockShortCode,
              password: mockPassword,
            ),
            throwsA(isA<WrongPasswordFailure>()),
          );
        },
      );

      test('throw Exception with "Unexpected error" message for unknown error',
          () async {
        // Arrange
        when(() => mockResponse.statusCode).thenReturn(200);
        // Simulate invalid JSON to trigger an unexpected error
        when(() => mockResponse.body).thenReturn('Invalid JSON response');
        when(() => httpClient.post(
              any(),
              headers: any(named: 'headers'),
              body: any(named: "body"),
            )).thenAnswer((_) async => mockResponse);

        // Act & Assert
        expect(
          () => spooMeApiClient.getUrlStatistics(
            shortCode: mockShortCode,
            password: mockPassword,
          ),
          throwsA(predicate((e) =>
              e is Exception && e.toString().contains('Unexpected error'))),
        );
      });

      test(
          'should return UrlStatisticsResponse instance with correct value when status code is 200',
          () async {
        when(() => mockResponse.statusCode).thenReturn(200);
        when(() => mockResponse.body).thenReturn('''
  {
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
  }
''');
        when(() => httpClient.post(
              any(),
              headers: mockHeaders,
              body: any(named: "body"),
            )).thenAnswer((_) async => mockResponse);
        final actual = await spooMeApiClient.getUrlStatistics(
          shortCode: mockShortCode,
        );
        expect(
            actual,
            isA<UrlStatisticsResponse>()
                .having((value) => value.id, 'id', 'dSP9do')
                .having((value) => value.shortCode, 'short_code', 'dSP9do')
                .having((value) => value.totalClicks, 'total-clicks', 1)
                .having((value) => value.creationDate, 'creation-date',
                    "2024-10-28")
                .having((value) => value.lastClickDate, 'last-click',
                    "2024-10-28 17:17:45")
                .having((value) => value.lastClickBrowser, 'last-click-browser',
                    "Chrome")
                .having((value) => value.averageRedirectionTime,
                    'average_redirection_time', 1.33)
                .having((value) => value.originalUrl,
                    'average_redirection_time', "https://www.google.com"));
      });
    });
  });
}
