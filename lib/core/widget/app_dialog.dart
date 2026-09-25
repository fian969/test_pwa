import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/core/widget/app_button.dart';
import 'package:flutter_setup_clean_architectute/gen/assets.gen.dart';

class DialogUIMode {
  final String title;
  final SvgGenImage? iconDialog;
  final String? description;
  final String? positiveLabel;
  final bool isShowNegative;
  final String? negativeLabel;
  final VoidCallback? onNegative;
  final VoidCallback? onPositive;

  DialogUIMode({
    required this.title,
    this.iconDialog,
    this.description,
    this.positiveLabel,
    this.onPositive,
    this.isShowNegative = true,
    this.negativeLabel,
    this.onNegative,
  });
}

class AppDialog extends StatelessWidget {
  final DialogUIMode model;

  const AppDialog({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        margin: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (model.iconDialog != null)
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: model.isShowNegative
                      ? AppColors.bgDanger
                      : AppColors.bgSuccess,
                  shape: BoxShape.circle,
                ),
                child: model.iconDialog?.svg(
                  height: 40.h,
                  colorFilter: _colorIcon,
                ),
              ),
            const SizedBox(height: 16),
            Text(
              model.title,
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.textBlack, fontSize: 14.sp),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    fontSize: 12.sp,
                    height: 40.h,
                    radius: 100,
                    color: AppColors.primary,
                    title: model.positiveLabel ?? "Ya",
                    onPressed: model.onPositive,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: AppButton(
                    fontSize: 12.sp,
                    height: 40.h,
                    radius: 100,
                    side: BorderSide(color: AppColors.primary),
                    color: AppColors.white,
                    colorTitle: AppColors.primary,
                    title: model.negativeLabel ?? "Tutup",
                    onPressed: () {
                      context.router.popForced();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ColorFilter? get _colorIcon => ColorFilter.mode(
        AppColors.danger,
        BlendMode.srcIn,
      );
}
