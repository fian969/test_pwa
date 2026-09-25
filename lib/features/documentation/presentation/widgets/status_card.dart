import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'dart:ui';

class StatusCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color backgroundColor;
  final Color iconBgColor;
  final VoidCallback? onRefresh;
  final bool isLoading;
  final Widget? statusWidget;

  const StatusCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.backgroundColor = const Color(0xFF4CAF50),
    this.iconBgColor = const Color(0xFF4CAF50),
    this.onRefresh,
    this.isLoading = false,
    this.statusWidget,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(200),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: Colors.white.withAlpha(100), width: 1),
            boxShadow: [BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 10, offset: const Offset(0, 2))],
          ),
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 48.w,
                    height: 48.w,
                    decoration: BoxDecoration(color: iconBgColor.withAlpha(150), borderRadius: BorderRadius.circular(12.r)),
                    child: Icon(icon, color: Colors.white, size: 24.sp),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600, color: AppColors.calmBlue)),
                        SizedBox(height: 4.h),
                        Text(subtitle, style: TextStyle(fontSize: 12.sp, color: backgroundColor, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  if (isLoading)
                    SizedBox(width: 24.w, height: 24.h, child: CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation<Color>(AppColors.calmBlue)))
                  else if (onRefresh != null)
                    GestureDetector(onTap: onRefresh, child: Icon(Icons.refresh, color: AppColors.calmBlue, size: 20.sp)),
                ],
              ),
              if (statusWidget != null) ...[SizedBox(height: 16.h), statusWidget!],
            ],
          ),
        ),
      ),
    );
  }
}
