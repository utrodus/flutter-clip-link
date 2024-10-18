import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart';

class CLButton extends StatelessWidget {
  const CLButton({
    required this.text,
    this.minimumSize,
    super.key,
    this.onPressed,
    this.leading,
    this.trailing,
  });

  final String text;
  final Size? minimumSize;
  final void Function()? onPressed;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: minimumSize ?? const Size(double.infinity, 44),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Offstage(
            offstage: leading == null,
            child: Padding(
              padding: const EdgeInsets.only(right: 6),
              child: leading,
            ),
          ),
          Flexible(
            child: Text(
              text,
              style: context.textTheme.labelLarge?.copyWith(
                color: onPressed != null
                    ? context.colorScheme.onPrimary
                    : context.colorScheme.onSurface.withOpacity(0.2),
                fontWeight: bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Offstage(
            offstage: trailing == null,
            child: Padding(
              padding: const EdgeInsets.only(left: 6),
              child: trailing,
            ),
          ),
        ],
      ),
    );
  }
}
