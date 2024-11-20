import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:go_router/go_router.dart';

enum CLDialogType { basic, delete, withoutCancelButton }

class ClDialog {
  ClDialog({
    required this.context,
    required this.title,
    required this.body,
    this.onPressedAccept,
    this.onPressedCancel,
    this.acceptTitle = 'Okay',
    this.cancelTitle = 'Cancel',
    this.type = CLDialogType.basic,
  }) {
    _show(
      context: context,
      type: type,
      acceptTitle: acceptTitle,
      cancelTitle: cancelTitle,
      title: title,
      body: body,
      onPressedAccept: onPressedAccept,
      onPressedCancel: onPressedCancel,
    );
  }

  final BuildContext context;
  final CLDialogType type;
  final String title;
  final String body;
  final String cancelTitle;
  final String acceptTitle;
  final void Function()? onPressedCancel;
  final void Function(BuildContext ctx)? onPressedAccept;

  void _show({
    required BuildContext context,
    required CLDialogType type,
    required String title,
    required String body,
    required String cancelTitle,
    required String acceptTitle,
    void Function(BuildContext ctx)? onPressedAccept,
    void Function()? onPressedCancel,
  }) =>
      showDialog(
        context: context,
        builder: (_) => Dialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                28,
              ),
            ),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: Breakpoints.mobile,
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: context.textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    body,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      if (type != CLDialogType.withoutCancelButton) ...[
                        TextButton(
                          onPressed: () {
                            context.pop();
                            onPressedCancel?.call();
                          },
                          child: Text(
                            cancelTitle,
                            style: context.textTheme.labelLarge,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                      TextButton(
                        onPressed: () {
                          context.pop();
                          onPressedAccept?.call(context);
                        },
                        child: Text(
                          acceptTitle,
                          style: context.textTheme.labelLarge?.copyWith(
                            color: type == CLDialogType.basic ||
                                    type == CLDialogType.withoutCancelButton
                                ? context.colorScheme.onSurface
                                : context.colorScheme.error,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
