import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart'; // Assuming core.dart defines scaffoldMessengerKey

enum CLSnackbarPosition { customWidth, top, bottom }

class CLSnackbar {
  /// CLSnackbar is a class that displays a snackbar without context.<br>
  /// Usage:
  /// ```dart
  /// CLSnackbar(message:'message')
  /// CLSnackbar.error(message:'message')
  /// ```
  CLSnackbar(
    this.message, {
    this.position,
    this.actionText,
    this.actionOnTap,
  }) {
    _showSnackbar(
      message: message,
      position: position ?? CLSnackbarPosition.bottom,
      color: scaffoldMessengerKey.currentContext?.colorScheme.inverseSurface,
      actionText: actionText,
      actionOnTap: actionOnTap,
    );
  }

  /// CLSnackbar.error is a method that displays a snackbar
  /// with a red background color.
  CLSnackbar.error(
    this.message, {
    this.position,
    this.actionText,
    this.actionOnTap,
  }) {
    _showSnackbar(
      message: message,
      position: position ?? CLSnackbarPosition.bottom,
      color: scaffoldMessengerKey.currentContext?.colorScheme.error,
      actionText: actionText,
      actionOnTap: actionOnTap,
    );
  }

  /// [String] message is a required parameter that displays the message
  final String message;

  /// [CLSnackbarPosition] position for the snackbar to be displayed<br>
  /// * CLSnackbarPosition.top
  /// * CLSnackbarPosition.bottom
  CLSnackbarPosition? position;

  /// [String] actionText is a text that displays the action
  String? actionText;

  /// [Function] actionOnTap is a function
  /// that will invoked when the action is pressed
  void Function()? actionOnTap;

  void _showSnackbar({
    required String message,
    Color? color,
    String? actionText,
    void Function()? actionOnTap,
    CLSnackbarPosition position = CLSnackbarPosition.bottom,
  }) {
    final snackBar = SnackBar(
      content: Text(message),
      width: position == CLSnackbarPosition.customWidth
          ? Breakpoints.mobile
          : null,
      backgroundColor: color ??
          scaffoldMessengerKey.currentContext?.colorScheme.inverseSurface,
      action: actionText != null
          ? SnackBarAction(
              label: actionText,
              onPressed: actionOnTap ??
                  () {
                    scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
                  },
            )
          : null,
      behavior: SnackBarBehavior.floating,
      margin: position == CLSnackbarPosition.top
          ? EdgeInsets.only(
              bottom: MediaQuery.of(scaffoldMessengerKey.currentContext!)
                      .size
                      .height -
                  100,
              left: 10,
              right: 10,
            )
          : position == CLSnackbarPosition.bottom
              ? const EdgeInsets.only(bottom: 16, left: 16, right: 16)
              : null,
    );

    scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }
}
