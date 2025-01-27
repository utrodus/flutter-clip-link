import 'package:animated_checkmark/animated_checkmark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class ShortenUrlItem extends StatefulWidget {
  const ShortenUrlItem({
    required this.shortUrl,
    required this.originalUrl,
    required this.onTapFavorite,
    required this.onTapItem,
    this.qrImageUrl,
    this.isFavorited = false,
    super.key,
  });

  final String? qrImageUrl;
  final String shortUrl;
  final String originalUrl;
  final bool isFavorited;
  final VoidCallback onTapItem;
  final VoidCallback onTapFavorite;

  @override
  State<ShortenUrlItem> createState() => _ShortenUrlItemState();
}

class _ShortenUrlItemState extends State<ShortenUrlItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      color: isSelected
          ? context.colorScheme.primary.withValues(alpha: 0.08)
          : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: context.colorScheme.outlineVariant,
          width: 0.5,
        ),
      ),
      child: InkWell(
        onTap: () {
          if (isSelected) {
            setState(() {
              isSelected = false;
            });
          } else {
            widget.onTapItem.call();
          }
        },
        onLongPress: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Padding(
          padding: const EdgeInsets.only(
            top: 18,
            bottom: 17,
            left: 12,
            right: 6,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AnimatedCrossFade(
                firstChild: CircleAvatar(
                  backgroundColor: context.colorScheme.primary,
                  radius: 22,
                  child: Checkmark(
                    checked: isSelected,
                    indeterminate: false,
                    curve: Curves.easeInOut,
                    size: 26,
                    autoSize: true,
                    weight: 3.5,
                    color: context.colorScheme.onPrimary,
                    drawCross: false,
                    rounded: false,
                    drawDash: false,
                    duration: const Duration(milliseconds: 200),
                  ),
                ),
                secondChild: Assets.images.qrExample.image(
                  width: 45,
                  height: 45,
                ),
                crossFadeState: isSelected
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 150),
              ),
              const SizedBox(
                width: 13,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.shortUrl,
                      style: context.textTheme.titleSmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      widget.originalUrl,
                      style: context.textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 19,
              ),
              IconButton(
                onPressed: widget.onTapFavorite.call,
                icon: Icon(
                  widget.isFavorited
                      ? IconsaxPlusBold.heart
                      : IconsaxPlusLinear.heart,
                  size: 22,
                  color: context.colorScheme.onPrimaryFixedVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
