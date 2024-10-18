import 'package:flutter/material.dart';
part 'breakpoints.dart';

class Responsive {
  Responsive(this.ctx);
  final BuildContext ctx;

  bool get isMobile => MediaQuery.sizeOf(ctx).width < Breakpoints.mobile;
  bool get isTablet =>
      MediaQuery.sizeOf(ctx).width >= Breakpoints.mobile &&
      MediaQuery.sizeOf(ctx).width < Breakpoints.tablet;

  bool get isDesktop =>
      MediaQuery.sizeOf(ctx).width >= Breakpoints.tablet &&
      MediaQuery.sizeOf(ctx).width < Breakpoints.desktop;

  bool get isLargeDesktop =>
      MediaQuery.sizeOf(ctx).width >= Breakpoints.desktop;

  Visibility onlyVisibleOnMobileTablet({
    required Widget child,
  }) =>
      Visibility(
        visible: isMobile || isTablet,
        child: child,
      );

  Visibility onlyVisibleOnDesktopAndLarge({
    required Widget child,
  }) =>
      Visibility(
        visible: isDesktop || isLargeDesktop,
        child: child,
      );

  LayoutBuilder builder({
    required Widget mobile,
    Widget? tablet,
    Widget? desktop,
  }) =>
      LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < Breakpoints.mobile) {
            return mobile;
          } else if (constraints.maxWidth < Breakpoints.tablet) {
            return tablet ?? mobile;
          } else {
            return desktop ?? mobile;
          }
        },
      );
}
