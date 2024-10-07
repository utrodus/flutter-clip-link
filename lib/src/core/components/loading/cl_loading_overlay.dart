import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:loader_overlay/loader_overlay.dart';

class CLLoadingOverlay extends StatelessWidget {
  const CLLoadingOverlay({required this.child, super.key});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      overlayColor: context.colorScheme.onSurface.withOpacity(0.5),
      overlayWidgetBuilder: (_) => Center(
        child: LoaderByPlatform(
          color: context.colorScheme.surface,
        ),
      ),
      child: child,
    );
  }
}
