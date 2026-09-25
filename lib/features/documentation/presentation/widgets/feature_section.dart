import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/domain/entities/feature_entity.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/presentation/widgets/feature_showcase.dart';

class FeaturedSection extends StatelessWidget {
  final FeatureEntity feature;
  const FeaturedSection({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Fitur Unggulan', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700, color: AppColors.primary)),
        SizedBox(height: 8.h),
        FeatureShowcase(feature: feature),
        SizedBox(height: 24.h),
      ],
    );
  }
}