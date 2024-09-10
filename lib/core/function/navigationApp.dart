import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void navTo(BuildContext context, String path) {
  GoRouter.of(context).push(path);
}

void popAppRouter(BuildContext context) {
  GoRouter.of(context).pop();
}
