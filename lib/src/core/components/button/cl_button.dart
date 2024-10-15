import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart';

class CLButton extends StatelessWidget {
  const CLButton({
    required this.text,
    this.minimumSize,
    super.key,
    this.onPressed,
  });

  final String text;
  final Size? minimumSize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: minimumSize ?? const Size(double.infinity, 44),
      ),
      child: Text(
        text,
        style: context.textTheme.labelLarge?.copyWith(
          color: onPressed != null
              ? context.colorScheme.onPrimary
              : context.colorScheme.onSurface.withOpacity(0.2),
          fontWeight: bold,
        ),
      ),
    );
  }
}
