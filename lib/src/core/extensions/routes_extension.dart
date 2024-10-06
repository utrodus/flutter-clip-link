import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/routes/routes.dart';
import 'package:go_router/go_router.dart';

extension RoutesExtension on Routes {
  void go(BuildContext context) => context.go(path);
  void goWithParams(BuildContext context, Object params) =>
      context.go(path, extra: params);
  void push(BuildContext context) => context.push(path);
  void pushWithParams(BuildContext context, Object params) =>
      context.push(path, extra: params);
}
