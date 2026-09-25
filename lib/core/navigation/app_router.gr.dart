// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<DashboardRouteArgs> {
  DashboardRoute({Key? key, int pageIndex = 0, List<PageRouteInfo>? children})
    : super(
        DashboardRoute.name,
        args: DashboardRouteArgs(key: key, pageIndex: pageIndex),
        initialChildren: children,
      );

  static const String name = 'DashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DashboardRouteArgs>(
        orElse: () => const DashboardRouteArgs(),
      );
      return DashboardPage(key: args.key, pageIndex: args.pageIndex);
    },
  );
}

class DashboardRouteArgs {
  const DashboardRouteArgs({this.key, this.pageIndex = 0});

  final Key? key;

  final int pageIndex;

  @override
  String toString() {
    return 'DashboardRouteArgs{key: $key, pageIndex: $pageIndex}';
  }
}

/// generated route for
/// [DocumentationDetailPage]
class DocumentationDetailRoute
    extends PageRouteInfo<DocumentationDetailRouteArgs> {
  DocumentationDetailRoute({
    Key? key,
    required FeatureEntity feature,
    List<PageRouteInfo>? children,
  }) : super(
         DocumentationDetailRoute.name,
         args: DocumentationDetailRouteArgs(key: key, feature: feature),
         initialChildren: children,
       );

  static const String name = 'DocumentationDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DocumentationDetailRouteArgs>();
      return DocumentationDetailPage(key: args.key, feature: args.feature);
    },
  );
}

class DocumentationDetailRouteArgs {
  const DocumentationDetailRouteArgs({this.key, required this.feature});

  final Key? key;

  final FeatureEntity feature;

  @override
  String toString() {
    return 'DocumentationDetailRouteArgs{key: $key, feature: $feature}';
  }
}

/// generated route for
/// [DocumentationPage]
class DocumentationRoute extends PageRouteInfo<void> {
  const DocumentationRoute({List<PageRouteInfo>? children})
    : super(DocumentationRoute.name, initialChildren: children);

  static const String name = 'DocumentationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DocumentationPage();
    },
  );
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginPage();
    },
  );
}

/// generated route for
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardingPage();
    },
  );
}

/// generated route for
/// [PayPage]
class PayRoute extends PageRouteInfo<void> {
  const PayRoute({List<PageRouteInfo>? children})
    : super(PayRoute.name, initialChildren: children);

  static const String name = 'PayRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PayPage();
    },
  );
}

/// generated route for
/// [QrisPage]
class QrisRoute extends PageRouteInfo<void> {
  const QrisRoute({List<PageRouteInfo>? children})
    : super(QrisRoute.name, initialChildren: children);

  static const String name = 'QrisRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const QrisPage();
    },
  );
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashPage();
    },
  );
}
