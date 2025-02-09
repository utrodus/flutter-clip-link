// ignore_for_file: empty_catches

import 'package:clip_link_database/clip_link_database.dart';
import 'package:clip_link_repository/clip_link_repository.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spoo_me_api/spoo_me_api.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spoo_me_api/spoo_me_api.dart' as spoo_me_api;

class MockSpooMeApiClient extends Mock implements spoo_me_api.SpooMeApiClient {}

class MockShortUrlResponse extends Mock
    implements spoo_me_api.ShortUrlResponse {}

class MockUrlStatisticsResponse extends Mock
    implements spoo_me_api.UrlStatisticsResponse {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('ClipLinkRepository', () {
    late spoo_me_api.SpooMeApiClient spooMeApiClient;
    late Database database;
    late ClipLinkRepository clipLinkRepository;
    late ClipLinkDatabaseClient clipLinkDatabaseClient;

    setUp(() {
      spooMeApiClient = MockSpooMeApiClient();
      final inMemory = DatabaseConnection(NativeDatabase.memory());
      database = Database.forTesting(inMemory);
      clipLinkDatabaseClient = ClipLinkDatabaseClient(database: database);
      clipLinkRepository = ClipLinkRepository(
        spooMeApiClient: spooMeApiClient,
        clipLinkDatabaseClient: clipLinkDatabaseClient,
      );
    });

    tearDown(() => database.close());

    group(
      'generateShortUrl',
      () {
        // final mockShortUrlResponse = MockShortUrlResponse();

        test('should call postShortenUrl once when generate short url',
            () async {
          try {
            await clipLinkRepository.generateShortUrl(
                url: 'https://www.utrodus.com');
          } catch (_) {}

          verify(() => spooMeApiClient.postShortenUrl(
              url: "https://www.utrodus.com")).called(1);
        });

        test('should throws exception when generate short url fails', () {
          when(() => spooMeApiClient.postShortenUrl(
              url: "https://www.utrodus.com")).thenThrow(Exception("Error"));
          expect(
            () => clipLinkRepository.generateShortUrl(
                url: "https://www.utrodus.com"),
            throwsA(isA<Exception>()),
          );
        });

        test(
            'should throw InvalidUrlRequestFailure when postShortenUrl throw InvalidUrlRequestFailure',
            () async {
          when(() => spooMeApiClient.postShortenUrl(
                  url: "https://www.utrodus.com"))
              .thenThrow(InvalidUrlRequestFailure());
          expect(
            () => clipLinkRepository.generateShortUrl(
                url: "https://www.utrodus.com"),
            throwsA(isA<InvalidUrlRequestFailure>()),
          );
        });

        test(
            'should throw AliasRequestFailure when postShortenUrl throw AliasRequestFailure',
            () async {
          when(() => spooMeApiClient.postShortenUrl(
              url: "https://www.utrodus.com")).thenThrow(AliasRequestFailure());
          expect(
            () => clipLinkRepository.generateShortUrl(
                url: "https://www.utrodus.com"),
            throwsA(isA<AliasRequestFailure>()),
          );
        });

        test(
            'should throw PasswordInvalidRequestFailure when postShortenUrl throw PasswordInvalidRequestFailure',
            () async {
          when(() => spooMeApiClient.postShortenUrl(
                  url: "https://www.utrodus.com"))
              .thenThrow(PasswordInvalidRequestFailure());
          expect(
            () => clipLinkRepository.generateShortUrl(
                url: "https://www.utrodus.com"),
            throwsA(isA<PasswordInvalidRequestFailure>()),
          );
        });

        // TODO fix unit test below
        // test('should return String shorten url when generate short url success',
        //     () async {
        //   when(() => mockShortUrlResponse.url)
        //       .thenReturn('https://www.spoo.me/utrd');
        //   when(() => spooMeApiClient.postShortenUrl(
        //           url: "https://www.utrodus.com"))
        //       .thenAnswer((_) async => mockShortUrlResponse);
        //   String? actual;
        //   try {
        //     actual = await clipLinkRepository.generateShortUrl(
        //         url: "https://www.utrodus.com");
        //   } catch (e) {}

        //   expect(actual, isNotEmpty);
        //   expect(actual, 'https://www.spoo.me/utrd');
        // });
        // TODO: add test - should return false when generate shorl url fail
      },
    );

    group('getShortCode', () {
      test('should return correctly shortCode value', () {
        const String shortenedUrl = "https://www.spoo.me/abcd";
        final String shortCode =
            clipLinkRepository.getShortCode(shortenedUrl: shortenedUrl);
        expect(shortCode, equals('abcd'));
      });
    });

    // TODO: add group for test addToFavorites function
    // TODO: add test should return true when addToFavorites success
    // TODO: add test should return false when addToFavorites fail

    // TODO: add group for test removeFromFavorites function
    // TODO: add test should return true when removeFromFavorites true
    // TODO: add test should return false when removeFromFavorites fail

    // TODO: add group for test getRecentsShortenedUrlItems function
    // TODO: add group for test getAllFavoritesShortUrlItems function

    group('loadUrlStatistics', () {
      test('should call getUrlStatistics once when load url statistics',
          () async {
        try {
          await clipLinkRepository.loadUrlStatistics(shortCode: 'asdfasd');
        } catch (_) {}
        verify(() => spooMeApiClient.getUrlStatistics(shortCode: 'asdfasd'))
            .called(1);
      });

      test('should throws exception when load url statistics fails', () {
        when(() => spooMeApiClient.getUrlStatistics(shortCode: 'asdfasd'))
            .thenThrow(Exception("Error"));
        expect(
          () => clipLinkRepository.loadUrlStatistics(shortCode: 'asdfasd'),
          throwsA(isA<Exception>()),
        );
      });

      test(
          'should throw UrlNotFoundRequestFailure when getUrlStatistics throw UrlNotFoundRequestFailure',
          () async {
        when(() => spooMeApiClient.getUrlStatistics(shortCode: 'asdfasd'))
            .thenThrow(UrlNotFoundRequestFailure());
        expect(
          () => clipLinkRepository.loadUrlStatistics(shortCode: 'asdfasd'),
          throwsA(isA<UrlNotFoundRequestFailure>()),
        );
      });

      test(
          'should throw WrongPasswordFailure when getUrlStatistics throw WrongPasswordFailure',
          () async {
        when(() => spooMeApiClient.getUrlStatistics(shortCode: 'asdfasd'))
            .thenThrow(WrongPasswordFailure());
        expect(
          () => clipLinkRepository.loadUrlStatistics(shortCode: 'asdfasd'),
          throwsA(isA<WrongPasswordFailure>()),
        );
      });

      test(
          'should return UrlStatisticsModel with correct value when getUrlStatistics success',
          () async {
        final mockUrlStatisticsResponse = MockUrlStatisticsResponse();
        when(() => mockUrlStatisticsResponse.id).thenReturn('asdfasd');
        when(() => mockUrlStatisticsResponse.shortCode).thenReturn('asdfasd');
        when(() => mockUrlStatisticsResponse.totalClicks).thenReturn(1);
        when(() => mockUrlStatisticsResponse.creationDate)
            .thenReturn('2024-10-28');
        when(() => mockUrlStatisticsResponse.lastClickDate)
            .thenReturn('2024-10-28 17:17:45');
        when(() => mockUrlStatisticsResponse.lastClickBrowser)
            .thenReturn('Chrome');
        when(() => mockUrlStatisticsResponse.lastClickOS).thenReturn('Linux');
        when(() => mockUrlStatisticsResponse.averageRedirectionTime)
            .thenReturn(1.33);
        when(() => mockUrlStatisticsResponse.originalUrl)
            .thenReturn('https://www.google.com');
        when(() => mockUrlStatisticsResponse.password).thenReturn('password');

        when(() => spooMeApiClient.getUrlStatistics(
              shortCode: 'asdfasd',
              password: 'password',
            )).thenAnswer((_) async => mockUrlStatisticsResponse);

        final actual = await clipLinkRepository.loadUrlStatistics(
          shortCode: 'asdfasd',
          password: 'password',
        );

        expect(
          actual,
          isA<UrlStatistics>()
              .having((value) => value.id, 'id', 'asdfasd')
              .having((value) => value.shortCode, 'short_code', 'asdfasd')
              .having((value) => value.totalClicks, 'total-clicks', 1)
              .having(
                  (value) => value.creationDate, 'creation-date', "2024-10-28")
              .having((value) => value.lastClickDate, 'last-click',
                  "2024-10-28 17:17:45")
              .having((value) => value.lastClickBrowser, 'last-click-browser',
                  "Chrome")
              .having((value) => value.averageRedirectionTime,
                  'average_redirection_time', 1.33)
              .having(
                  (value) => value.originalUrl, 'url', "https://www.google.com")
              .having((value) => value.password, 'password', 'password'),
        );
      });
    });
  });
}
