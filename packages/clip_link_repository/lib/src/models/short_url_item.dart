class ShortUrlItem {
  int? id;
  String shortCode;
  String originalUrl;
  String shortenedUrl;
  bool isHavePassword;
  bool isFavorited;
  String? password;

  ShortUrlItem({
    this.id,
    required this.shortCode,
    required this.originalUrl,
    required this.shortenedUrl,
    required this.isHavePassword,
    required this.isFavorited,
    this.password,
  });
}
