import 'package:equatable/equatable.dart';

class ShortenItemEntity extends Equatable {
  const ShortenItemEntity({
    required this.id,
    required this.isSelected,
    required this.qrImageUrl,
    required this.shortUrl,
    required this.originalUrl,
    required this.isFavorited,
  });

  final String id;
  final String qrImageUrl;
  final String shortUrl;
  final String originalUrl;
  final bool isFavorited;
  final bool isSelected;

  @override
  List<Object?> get props => [
        id,
        qrImageUrl,
        shortUrl,
        originalUrl,
        isFavorited,
        isSelected,
      ];
}
