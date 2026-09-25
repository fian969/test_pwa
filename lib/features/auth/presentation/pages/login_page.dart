import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/core/extensions/session_manager.dart';
import 'package:flutter_setup_clean_architectute/core/navigation/app_router.dart';
import 'package:flutter_setup_clean_architectute/core/utils/logger.dart';
import 'package:flutter_setup_clean_architectute/core/utils/snackbar_helper.dart';
import 'package:flutter_setup_clean_architectute/core/widget/app_button.dart';
import 'package:flutter_setup_clean_architectute/features/auth/presentation/widget/form_login.dart';
import 'package:flutter_setup_clean_architectute/gen/assets.gen.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _sessionManager = SessionManager();
  // final _loginCubit = getIt<LoginCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned(
            top: -32,
            right: -64,
            child: Assets.images.dummy.vectorFully.svg(),
          ),
          Positioned(
            bottom: -64,
            left: -64,
            child: Assets.images.dummy.ellipseFully.svg(),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 160.h),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.textBlack,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    FormLogin(
                      usernameController: _usernameController,
                      passwordController: _passwordController,
                      onForgotPasswordTap: () =>
                          SnackBarHelper.showSnackBarError(
                            context,
                            "Fitur Masih Proses Pengembangan",
                          ),
                    ),
                    SizedBox(height: 40.h),
                    AppButton(
                      title: 'Masuk',
                      height: 48.h,
                      radius: 100.r,
                      onPressed: () async {
                        logger.i("email: ${_usernameController.text}");
                        logger.i("password: ${_passwordController.text}");
                        if (!_formKey.currentState!.validate()) return;
                        final router = context.router;
                        await _sessionManager.setLoginStatus(true);
                        if (!mounted) return;
                        router.replaceAll([DashboardRoute()]);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // ),
    );
  }

  String title = "Bertransasksilah dengan baik dengan POS Apps";
}
