import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/presentation/widgets/common_widgets.dart';

class TipsSection extends StatelessWidget {
  const TipsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.calmBlue.withAlpha(50),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.calmBlue.withAlpha(150), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info, color: AppColors.calmBlue, size: 18.sp),
              SizedBox(width: 8.w),
              const SectionTitle('Tips'),
            ],
          ),
          SizedBox(height: 8.h),
          const DescriptionText(
            '• Aktifkan Bluetooth\n• Printer sudah dipasangkan\n• Cek koneksi jika gagal\n• Tersedia kertas untuk thermal printer',
          ),
        ],
      ),
    );
  }
}
