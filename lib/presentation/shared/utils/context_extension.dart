import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  LinearGradient get gradient =>
      LinearGradient(colors: [theme.primaryColor, theme.colorScheme.secondary]);

  Future<T?> push<T>(Widget widget, {bool fullscreenDialog = false}) async =>
      await Navigator.push<T>(
        this,
        MaterialPageRoute(
          builder: (context) => widget,
          fullscreenDialog: fullscreenDialog,
        ),
      );

  void pushReplacement(Widget widget, {bool fullscreenDialog = false}) =>
      Navigator.pushReplacement(
        this,
        MaterialPageRoute(
          builder: (context) => widget,
          fullscreenDialog: fullscreenDialog,
        ),
      );
}
