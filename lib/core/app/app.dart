import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/di/injection.dart';
import 'package:flutter_setup_clean_architectute/core/navigation/app_router.dart';
import 'package:flutter_setup_clean_architectute/core/utils/logger.dart';
import 'package:loader_overlay/loader_overlay.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    logger.d('App: build app');
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GlobalLoaderOverlay(
        child: MaterialApp.router(
          title: 'Setup Clean Architecture',
          debugShowCheckedModeBanner: false,
          routerConfig: getIt<AppRouter>().config(
            navigatorObservers: () => [
              AutoRouteObserver(),
              // AppStatusBarObserver(),
            ],
          ),
          theme: ThemeData(
            fontFamily: 'Nunito',
            colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Color(0xFF0087CD),
              onPrimary: Color(0xFFFAFAFA),
              secondary: Color(0xFFFFD700),
              onSecondary: Color(0xFFFAFAFA),
              error: Color(0xFFFF4E57),
              onError: Color(0xFFFF1744),
              surface: Color(0xFFFFFFFF),
              onSurface: Color(0xFF707070),
            ),
          ),
        ),
      ),
    );
  }
}
