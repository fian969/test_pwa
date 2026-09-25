import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'dart:ui';

class ProfileHeader extends StatelessWidget {
  final bool isDarkMode;
  final Color cardBackgroundColor;
  final Color borderColor;
  final Color textColor;
  final Color subtextColor;

  const ProfileHeader({
    super.key,
    required this.isDarkMode,
    required this.cardBackgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.subtextColor,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          decoration: BoxDecoration(
            color: cardBackgroundColor,
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(
              color: borderColor,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.calmBlue.withAlpha(40),
                blurRadius: 20,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              const _Avatar(),
              SizedBox(height: 16.h),
              Text(
                'Developer Flutter',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'Dokumentasi Fitur v1.0.0',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: subtextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 80.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.calmBlue.withAlpha(220),
            AppColors.calmBlueDark.withAlpha(200),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          'DF',
          style: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
