enum Routes {
  splash('/'),
  listShorten('/list-shorten'),
  addNewShortenURL('add-new-shorten-url'),
  inputPassword('input-password/:shortCode'),
  detailShortenURL('detail/:shortCode'),
  detailFavorites('detail/:shortCode'),
  listFavorites('/list-favorites'),
  settings('/settings'),
  about('about'),
  aboutDeveloper('about-developers'),
  apiRateLimits('api-limit');

  const Routes(this.path);
  final String path;
}
