import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/domain/entities/feature_entity.dart';

class FeatureShowcase extends StatelessWidget {
  final FeatureEntity feature;

  const FeatureShowcase({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(color: AppColors.secondary.withAlpha(150), borderRadius: BorderRadius.circular(16.r), boxShadow: [BoxShadow(color: AppColors.secondary.withAlpha(40), blurRadius: 20)]),
      child: Row(children: [
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(feature.name, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700, color: Colors.black)),
          SizedBox(height: 4.h),
          Text(feature.description, style: TextStyle(fontSize: 11.sp, color: Colors.black87, height: 1.4), maxLines: 2, overflow: TextOverflow.ellipsis),
        ])),
        SizedBox(width: 12.w),
        Container(padding: EdgeInsets.all(8.w), decoration: BoxDecoration(color: Colors.black.withAlpha(100), shape: BoxShape.circle), child: Icon(Icons.arrow_forward_ios, size: 14.sp, color: Colors.white)),
      ]),
    );
  }
}