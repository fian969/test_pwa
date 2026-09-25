import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/gen/assets.gen.dart';

enum BottomSheetOptionsMode {
  normal,
  selected,
  unselected;
}

class AppBottomSheetFilterOptionUi extends StatelessWidget {
  final String title;
  final SvgGenImage icon;
  final String? label;
  final String? description;
  final BottomSheetOptionsMode mode;
  final VoidCallback onTap;
  final bool isShowChevronRight;

  const AppBottomSheetFilterOptionUi({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.label,
    this.description,
    this.mode = BottomSheetOptionsMode.normal,
    this.isShowChevronRight = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: description != null ? 80.h : 70.h,
        decoration: BoxDecoration(
          color: _background,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: _border, width: 2),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Row(
          children: [
            icon.svg(
              colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              height: 35.h,
              width: 35.w,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (label != null)
                  Text(
                    "$label",
                    style: TextStyle(fontSize: 10.sp),
                  ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: _foreground,
                  ),
                ),
                if (description != null) ...[
                  SizedBox(height: 4.h),
                  Text(
                    "$description",
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ],
              ],
            ),
            if (isShowChevronRight) ...[
              const Spacer(),
              Assets.icons.ewallet.dana.svg(
                colorFilter: ColorFilter.mode(_foreground, BlendMode.srcIn),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color get _background => mode == BottomSheetOptionsMode.unselected
      ? const Color(0xFFE2E0E1)
      : Colors.white;

  Color get _foreground => mode == BottomSheetOptionsMode.unselected
      ? const Color(0xFF757575)
      : Colors.black;

  Color get _border => switch (mode) {
        BottomSheetOptionsMode.selected => AppColors.primary,
        BottomSheetOptionsMode.unselected => Colors.transparent,
        _ => const Color(0xFFE2E0E1),
      };
}
