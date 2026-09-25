import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'dart:ui';

class ProfileAboutSection extends StatelessWidget {
  final bool isDarkMode;
  final Color cardBackgroundColor;
  final Color borderColor;
  final Color textColor;
  final Color subtextColor;

  const ProfileAboutSection({
    super.key,
    required this.isDarkMode,
    required this.cardBackgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.subtextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tentang',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),
        SizedBox(height: 12.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(
              decoration: BoxDecoration(
                color: cardBackgroundColor,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: borderColor,
                  width: 1,
                ),
              ),
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Aplikasi Dokumentasi Fitur',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Aplikasi ini menyediakan dokumentasi lengkap untuk semua fitur yang tersedia dalam project Flutter dengan Clean Architecture.',
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: subtextColor,
                      height: 1.6,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Expanded(
                        child: _InfoColumn(
                          label: 'Versi',
                          value: '1.0.0',
                          subtextColor: subtextColor,
                          valueColor: AppColors.calmBlue,
                        ),
                      ),
                      Expanded(
                        child: _InfoColumn(
                          label: 'Tanggal Rilis',
                          value: '27 Agustus 2026',
                          subtextColor: subtextColor,
                          valueColor: textColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _InfoColumn extends StatelessWidget {
  final String label;
  final String value;
  final Color subtextColor;
  final Color valueColor;

  const _InfoColumn({
    required this.label,
    required this.value,
    required this.subtextColor,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 10.sp,
            color: subtextColor,
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          value,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}
