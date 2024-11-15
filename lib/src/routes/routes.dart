enum Routes {
  splash('/'),
  listShorten('/list-shorten'),
  addNewShortenURL('add-new-shorten-url'),
  detailShortenURL('detail-shorten-url'),
  listFavorites('/list-favorites'),
  search('search'),
  settings('/settings'),
  about('about'),
  aboutDeveloper('about-developers'),
  apiRateLimits('api-limit');

  const Routes(this.path);
  final String path;
}
