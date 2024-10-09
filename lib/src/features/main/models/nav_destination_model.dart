import 'package:flutter/widgets.dart';

class NavDestinationModel {
  NavDestinationModel({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });
  final Icon icon;
  final Icon selectedIcon;
  final String label;
}
