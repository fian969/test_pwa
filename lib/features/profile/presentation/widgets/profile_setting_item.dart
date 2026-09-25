import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'dart:ui';

class ProfileSettingItem extends StatelessWidget {
  final bool isDarkMode;
  final IconData icon;
  final String label;
  final Widget trailing;

  const ProfileSettingItem({
    super.key,
    required this.isDarkMode,
    required this.icon,
    required this.label,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: isDarkMode
                  ? Colors.black.withAlpha(200)
                  : Colors.white.withAlpha(200),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: isDarkMode
                    ? Colors.white.withAlpha(50)
                    : Colors.white.withAlpha(100),
                width: 1,
              ),
            ),
            padding: EdgeInsets.all(12.w),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: AppColors.calmBlue,
                  size: 20.sp,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: isDarkMode ? Colors.white : AppColors.calmBlue,
                    ),
                  ),
                ),
                trailing,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
