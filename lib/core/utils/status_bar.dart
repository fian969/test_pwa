import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppStatusBarObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    _updateStatusBar(route);
    super.didPush(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    if (newRoute != null) {
      _updateStatusBar(newRoute);
    }
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    if (previousRoute != null) {
      _updateStatusBar(previousRoute);
    }
    super.didPop(route, previousRoute);
  }

  void _updateStatusBar(Route route) {
    if (route is MaterialPageRoute) {
      final context = route.subtreeContext;
      if (context != null) {
        final theme = Theme.of(context);
        final appBarColor =
            theme.appBarTheme.backgroundColor ?? theme.colorScheme.primary;

        final brightness = ThemeData.estimateBrightnessForColor(appBarColor);

        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: appBarColor,
            statusBarIconBrightness: brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark,
          ),
        );
      }
    }
  }
}
