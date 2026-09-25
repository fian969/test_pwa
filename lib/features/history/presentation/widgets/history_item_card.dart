import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/features/history/presentation/models/history_models.dart';
import 'dart:ui';

class HistoryItemCard extends StatelessWidget {
  final HistoryItem item;
  final String formattedTime;

  const HistoryItemCard({
    super.key,
    required this.item,
    required this.formattedTime,
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
            border: Border.all(
              color: Colors.white.withAlpha(100),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(15),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: EdgeInsets.all(12.w),
          child: Row(
            children: [
              _AvatarBadge(name: item.featureName),
              SizedBox(width: 12.w),
              Expanded(
                child: _FeatureInfo(
                  featureName: item.featureName,
                  action: item.action,
                  formattedTime: formattedTime,
                ),
              ),
              _CategoryBadge(category: item.category),
            ],
          ),
        ),
      ),
    );
  }
}

class _AvatarBadge extends StatelessWidget {
  final String name;

  const _AvatarBadge({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.w,
      height: 48.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.calmBlue.withAlpha(220),
            AppColors.calmBlueDark.withAlpha(200),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: Text(
          name[0].toUpperCase(),
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _FeatureInfo extends StatelessWidget {
  final String featureName;
  final String action;
  final String formattedTime;

  const _FeatureInfo({
    required this.featureName,
    required this.action,
    required this.formattedTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          featureName,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.calmBlue,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          '$action • $formattedTime',
          style: TextStyle(
            fontSize: 11.sp,
            color: AppColors.textGrey2,
          ),
        ),
      ],
    );
  }
}

class _CategoryBadge extends StatelessWidget {
  final String category;

  const _CategoryBadge({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 4.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.calmBlue.withAlpha(150),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        category,
        style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
