import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/domain/entities/feature_entity.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/presentation/widgets/glass_container.dart';

class FeatureCard extends StatelessWidget {
  final FeatureEntity feature;
  final VoidCallback? onTap;

  const FeatureCard({
    super.key,
    required this.feature,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      onTap: onTap,
      blurStrength: 15,
      glassColor: const Color(0xFFFFFFFF),
      borderRadius: 16,
      padding: EdgeInsets.all(16.w),
      boxShadow: [
        BoxShadow(
          color: AppColors.primary.withAlpha(30),
          blurRadius: 20,
          offset: const Offset(0, 5),
        ),
      ],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  feature.name,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 4.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.secondary.withAlpha(200),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  feature.category,
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),

          // Description
          Text(
            feature.description,
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.textGrey2,
              height: 1.5,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8.h),

          // Tags
          Wrap(
            spacing: 4.w,
            runSpacing: 4.h,
            children: feature.tags.take(2).map((tag) {
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 6.w,
                  vertical: 2.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.calmBlue.withAlpha(80),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(
                  tag,
                  style: TextStyle(
                    fontSize: 9.sp,
                    color: AppColors.calmBlue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),

          SizedBox(height: 8.h),

          // Arrow indicator
          Align(
            alignment: Alignment.bottomRight,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 14.sp,
              color: AppColors.primary.withAlpha(150),
            ),
          ),
        ],
      ),
    );
  }
}
