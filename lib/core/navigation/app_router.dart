import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_setup_clean_architectute/core/utils/logger.dart';
import 'package:flutter_setup_clean_architectute/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:flutter_setup_clean_architectute/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_setup_clean_architectute/features/auth/presentation/pages/onboarding_page.dart';
import 'package:flutter_setup_clean_architectute/features/auth/presentation/pages/splash_page.dart';
import 'package:flutter_setup_clean_architectute/features/dashboard/presentation/pages/pay_page.dart';
import 'package:flutter_setup_clean_architectute/features/dashboard/presentation/pages/qris_page.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/presentation/pages/documentation_page.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/presentation/pages/documentation_detail_page.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/domain/entities/feature_entity.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes {
    logger.d('AppRouter: routes');
    return [
      AutoRoute(page: SplashRoute.page, initial: true),
      AutoRoute(page: OnboardingRoute.page),
      AutoRoute(page: DashboardRoute.page),
      AutoRoute(page: LoginRoute.page),
      AutoRoute(page: DocumentationRoute.page),
      AutoRoute(page: PayRoute.page),
      AutoRoute(page: QrisRoute.page),
      AutoRoute(page: DocumentationDetailRoute.page),
    ];
  }

  // @override
  // List<AutoRouteGuard> get guards => [AuthGuard()];
}
