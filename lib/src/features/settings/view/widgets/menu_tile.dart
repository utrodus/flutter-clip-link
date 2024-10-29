import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart';

class MenuTile extends StatelessWidget {
  const MenuTile({
    required this.title,
    required this.leading,
    required this.trailing,
    super.key,
    this.onTap,
  });
  final String title;
  final Widget leading;
  final Widget trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 12,
      ),
      onTap: onTap,
      title: Text(
        title,
        style: context.textTheme.titleMedium,
      ),
      leading: leading,
      trailing: trailing,
    );
  }
}
