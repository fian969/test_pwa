import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/core/widget/app_field.dart';

class FormLogin extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final VoidCallback? onForgotPasswordTap;

  const FormLogin({
    super.key,
    required this.usernameController,
    required this.passwordController,
    this.onForgotPasswordTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        AppField(
          hint: 'Masukkan Email',
          keyboardType: TextInputType.emailAddress,
          controller: usernameController,
          validator: (v) {
            if (v == null || v.isEmpty) {
              return 'username Harus Diisi';
            }
            return null;
          },
        ),
        AppField(
          hint: 'Masukkan Password',
          type: AppFieldType.password,
          controller: passwordController,
          validator: (v) {
            if (v == null || v.isEmpty) {
              return 'Password baru harus diisi';
            }
            if (v.length < 8) {
              return 'Password minimal 8 karakter';
            }
            final hasLetter = v.contains(RegExp(r'[a-z]'));
            final hasNumber = v.contains(RegExp(r'\d'));
            if (!hasLetter || !hasNumber) {
              return 'Password harus mengandung huruf dan angka';
            }
            return null;
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: onForgotPasswordTap,
              child: Text(
                'Lupa Password ?',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ),
            SizedBox(width: 4.w)
          ],
        ),
      ],
    );
  }
}
