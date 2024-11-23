import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class DetailShortenUrlPassword extends StatefulWidget {
  const DetailShortenUrlPassword({
    required this.password,
    super.key,
  });
  final String password;

  @override
  State<DetailShortenUrlPassword> createState() =>
      _DetailShortenUrlPasswordState();
}

class _DetailShortenUrlPasswordState extends State<DetailShortenUrlPassword> {
  bool isCanShowPassword = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      color: context.colorScheme.surfaceContainerLowest,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              isCanShowPassword
                  ? widget.password
                  : widget.password.replaceAll(
                      RegExp('.'),
                      '*',
                    ),
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: medium,
                color: context.colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isCanShowPassword = !isCanShowPassword;
              });
            },
            icon: const Icon(
              IconsaxPlusLinear.eye,
            ),
          ),
          IconButton(
            onPressed: () async {
              await copyToClipboard(widget.password);
              CLSnackbar(
                '✅ Password copied to clipboard!',
                position: CLSnackbarPosition.customWidth,
              );
            },
            icon: const Icon(
              IconsaxPlusLinear.copy,
            ),
          ),
        ],
      ),
    );
  }
}
