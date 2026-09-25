import 'package:auto_route/auto_route.dart';
import 'package:flutter_setup_clean_architectute/core/navigation/app_router.dart';
import 'package:flutter_setup_clean_architectute/core/utils/logger.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    // final userId = await getIt<LocalStorage>().getUserId();
    // await getIt<GetUserCubit>().getUserById(userId ?? 0);
    // final token = await getIt<LocalStorage>().readToken();
    logger.d("tessssss auth guard");
    final routeName = resolver.route.name;

    final accessibleRoutes = {
      SplashRoute.name,
      OnboardingRoute.name,
      LoginRoute.name,
    };

    // final isLoggedIn = token != null && token.isNotEmpty;
    // logger.d("token statuses: $isLoggedIn");

    if (!accessibleRoutes.contains(routeName)) {
      router.push(const LoginRoute());
    } else {
      resolver.next();
    }
    // resolver.next();
  }
}
