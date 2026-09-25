import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/gen/assets.gen.dart';

class QrActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final SvgGenImage icon;
  final VoidCallback onTap;

  const QrActionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: onTap,
      child: Ink(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          gradient: AppColors.glassBlueGradient,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: AppColors.calmBlueLight.withValues(alpha: 0.4),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 38.w,
              height: 38.w,
              decoration: BoxDecoration(
                gradient: AppColors.calmBlueGradient,
                borderRadius: BorderRadius.circular(12.r),
              ),
              alignment: Alignment.center,
              child: icon.svg(
                width: 18.w,
                height: 18.w,
                colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.textBlack,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              subtitle,
              style: TextStyle(fontSize: 12.sp, color: AppColors.textGrey2),
            ),
          ],
        ),
      ),
    );
  }
}
