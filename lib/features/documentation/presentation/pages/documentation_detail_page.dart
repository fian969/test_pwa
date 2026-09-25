import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/domain/entities/feature_entity.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/presentation/widgets/common_widgets.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/presentation/widgets/print_service_button.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/presentation/widgets/glass_container.dart';
import 'dart:ui';

@RoutePage()
class DocumentationDetailPage extends StatelessWidget {
  final FeatureEntity feature;

  const DocumentationDetailPage({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: DetailAppBar(title: feature.name, onBack: () => Navigator.pop(context)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryBadge(feature.category),
            SizedBox(height: 16.h),
            Text(feature.name, style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700, color: AppColors.calmBlue)),
            SizedBox(height: 12.h),
            DescriptionText(feature.description),
            SizedBox(height: 24.h),
            if (feature.name.toLowerCase().contains('print')) const PrintServiceButton(),
            const SectionTitle('Cara Penggunaan'),
            SizedBox(height: 8.h),
            GlassContainer(child: DescriptionText(feature.usage)),
            SizedBox(height: 24.h),
            if (feature.tags.isNotEmpty) ...[
              const SectionTitle('Tags'),
              SizedBox(height: 8.h),
              Wrap(spacing: 8.w, runSpacing: 8.h, children: feature.tags.map((tag) => _TagChip(tag)).toList()),
              SizedBox(height: 24.h),
            ],
            const SectionTitle('Contoh Kode'),
            SizedBox(height: 8.h),
            _CodeSection(feature.example),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  final String tag;
  const _TagChip(this.tag);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(color: AppColors.calmBlueLight.withAlpha(150), borderRadius: BorderRadius.circular(8.r)),
      child: Text(tag, style: TextStyle(fontSize: 11.sp, color: Colors.white, fontWeight: FontWeight.w600)),
    );
  }
}

class _CodeSection extends StatelessWidget {
  final String code;
  const _CodeSection(this.code);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          decoration: BoxDecoration(color: AppColors.grey1.withAlpha(30), borderRadius: BorderRadius.circular(12.r), border: Border.all(color: Colors.white.withAlpha(100), width: 1)),
          padding: EdgeInsets.all(12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(code, style: TextStyle(fontSize: 11.sp, color: AppColors.textGrey2, fontFamily: 'Courier', height: 1.5)),
              ),
              SizedBox(height: 12.h),
              GestureDetector(
                onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text('Kode disalin!'), backgroundColor: AppColors.calmBlue)),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  decoration: BoxDecoration(color: AppColors.calmBlue.withAlpha(150), borderRadius: BorderRadius.circular(6.r)),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Icon(Icons.copy, size: 14.sp, color: Colors.white),
                    SizedBox(width: 6.w),
                    Text('Salin Kode', style: TextStyle(fontSize: 11.sp, color: Colors.white, fontWeight: FontWeight.w600)),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
