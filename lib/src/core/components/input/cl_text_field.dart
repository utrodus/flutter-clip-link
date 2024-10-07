import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CLTextField extends StatelessWidget {
  /// CLTextField is a custom widget that use [ReactiveTextField] <br>
  /// it provides base input decoration style.
  const CLTextField({
    required this.fcontrolName,
    required this.textInputAction,
    required this.onSubmitted,
    required this.validationMessages,
    super.key,
    this.prefixIcon,
    this.suffix,
    this.label,
    this.hintText,
    this.obscureText,
  });

  final String fcontrolName;
  final Widget? suffix;
  final TextInputAction? textInputAction;
  final String? label;
  final String? hintText;
  final void Function(FormControl<Object?>)? onSubmitted;
  final Map<String, String Function(Object)>? validationMessages;
  final bool? obscureText;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: fcontrolName,
      textInputAction: textInputAction,
      onSubmitted: onSubmitted,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      validationMessages: validationMessages,
      obscureText: obscureText ?? false,
      decoration: const InputDecoration()
          .applyDefaults(Theme.of(context).inputDecorationTheme)
          .copyWith(
            label: label != null
                ? Text(
                    label!,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  )
                : null,
            hintText: hintText,
            hintStyle: context.textTheme.bodyLarge?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    color: context.colorScheme.secondary,
                  )
                : null,
            suffix: suffix,
          ),
    );
  }
}
