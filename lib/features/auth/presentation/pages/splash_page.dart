import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/core/extensions/session_manager.dart';
import 'package:flutter_setup_clean_architectute/core/navigation/app_router.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _sessionManager = SessionManager();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () async {
      final isLoggedIn = await _sessionManager.isLoggedIn();
      if (!mounted) return;
      if (isLoggedIn) {
        context.router.replaceAll([DashboardRoute()]);
      } else {
        context.router.replaceAll([const OnboardingRoute()]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.width * 0.3,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
