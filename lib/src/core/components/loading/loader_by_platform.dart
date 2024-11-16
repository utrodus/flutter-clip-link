import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart';

/// LoadingByPlatform widget is a widget that displays a loading indicator
/// based on the platform.
class LoaderByPlatform extends StatelessWidget {
  const LoaderByPlatform({
    super.key,
    this.color,
    this.strokeWidth,
    this.radius,
  });
  final Color? color;
  final double? strokeWidth;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? CircularProgressIndicator(
            color: color ?? context.colorScheme.onSurface,
            strokeWidth: strokeWidth ?? 4.5,
          )
        : Platform.isIOS
            ? CupertinoActivityIndicator(
                color: color ?? context.colorScheme.onSurface,
                radius: radius ?? 20,
              )
            : CircularProgressIndicator(
                color: color ?? context.colorScheme.onSurface,
                strokeWidth: strokeWidth ?? 4.5,
              );
  }
}
