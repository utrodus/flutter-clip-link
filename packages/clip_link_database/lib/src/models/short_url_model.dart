class ShortUrlModel {
  final int id;
  final String shortCode;
  final String originalUrl;
  final String shortenedUrl;
  final String? password;
  final bool isHavePassword;
  final bool isFavorited;

  const ShortUrlModel({
    required this.id,
    required this.shortCode,
    required this.originalUrl,
    required this.shortenedUrl,
    required this.isHavePassword,
    required this.isFavorited,
    this.password,
  });
}
