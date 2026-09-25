import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/core/navigation/app_router.dart';
import 'package:flutter_setup_clean_architectute/core/utils/logger.dart';
import 'package:flutter_setup_clean_architectute/gen/assets.gen.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () async {
      if (!mounted) return;
      logger.i("message tesss");
      context.router.replaceAll([const LoginRoute()]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Assets.images.dummy.onboarding.image(fit: BoxFit.cover),
          ),
          Container(
            decoration: BoxDecoration(gradient: AppColors.bgColorOnboarding),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 40.h),
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
