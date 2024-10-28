enum Routes {
  splash('/'),
  listShorten('/list-shorten'),
  addNewShortenURL('add-new-shorten-url'),
  detailShortenURL('detail-shorten-url'),
  listFavorites('/list-favorites'),
  search('search'),
  settings('/settings'),
  about('about'),
  faq('faq');

  const Routes(this.path);
  final String path;
}
