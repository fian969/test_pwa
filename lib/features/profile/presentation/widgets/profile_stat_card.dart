import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'dart:ui';

class ProfileStatCard extends StatelessWidget {
  final bool isDarkMode;
  final IconData icon;
  final String label;
  final String value;

  const ProfileStatCard({
    super.key,
    required this.isDarkMode,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          decoration: BoxDecoration(
            color: isDarkMode
                ? Colors.black.withAlpha(200)
                : Colors.white.withAlpha(200),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: isDarkMode
                  ? Colors.white.withAlpha(50)
                  : Colors.white.withAlpha(100),
              width: 1,
            ),
          ),
          padding: EdgeInsets.all(12.w),
          child: Column(
            children: [
              Container(
                width: 36.w,
                height: 36.w,
                decoration: BoxDecoration(
                  color: AppColors.calmBlue.withAlpha(150),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 18.sp,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: isDarkMode ? Colors.white : AppColors.calmBlue,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: isDarkMode
                      ? const Color(0xFFB0B0B0)
                      : AppColors.grey1,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
