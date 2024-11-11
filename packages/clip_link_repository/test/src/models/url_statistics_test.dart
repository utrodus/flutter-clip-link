import 'package:spoo_me_api/spoo_me_api.dart';
import 'package:test/test.dart';
import 'package:clip_link_repository/clip_link_repository.dart';

void main() {
  group('UrlStatisticsModel', () {
    test(
      'should be able to convert UrlStatisticsResponse to model',
      () {
        final urlStatisticsResponse = UrlStatisticsResponse(
          id: 'id',
          shortCode: 'shortCode',
          totalClicks: 1,
          creationDate: 'creationDate',
          lastClickDate: 'lastClickDate',
          lastClickBrowser: 'lastClickBrowser',
          lastClickOS: 'lastClickOS',
          averageRedirectionTime: 1,
          originalUrl: 'originalUrl',
          password: 'password',
        );
        final urlStatisticsModel =
            UrlStatisticsModel.toModel(urlStatisticsResponse);
        expect(urlStatisticsModel.id, urlStatisticsResponse.id);
        expect(urlStatisticsModel.shortCode, urlStatisticsResponse.shortCode);
        expect(
            urlStatisticsModel.totalClicks, urlStatisticsResponse.totalClicks);
        expect(urlStatisticsModel.creationDate,
            urlStatisticsResponse.creationDate);
        expect(urlStatisticsModel.lastClickDate,
            urlStatisticsResponse.lastClickDate);
        expect(urlStatisticsModel.lastClickBrowser,
            urlStatisticsResponse.lastClickBrowser);
        expect(
            urlStatisticsModel.lastClickOS, urlStatisticsResponse.lastClickOS);
        expect(urlStatisticsModel.averageRedirectionTime,
            urlStatisticsResponse.averageRedirectionTime);
        expect(
            urlStatisticsModel.originalUrl, urlStatisticsResponse.originalUrl);
        expect(urlStatisticsModel.password, urlStatisticsResponse.password);
      },
    );
  });
}
