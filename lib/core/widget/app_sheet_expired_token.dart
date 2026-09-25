import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/core/widget/app_button.dart';
import 'package:flutter_setup_clean_architectute/core/widget/app_text_label.dart';
import 'package:flutter_setup_clean_architectute/gen/assets.gen.dart';

class AppSheetExpiredToken<T> extends StatefulWidget {
  final String message;

  const AppSheetExpiredToken({
    super.key,
    required this.message,
  });

  @override
  State<AppSheetExpiredToken> createState() => _AppSheetExpiredTokenState();
}

class _AppSheetExpiredTokenState extends State<AppSheetExpiredToken> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 40.h),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 60.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.danger,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            AppTextLabel(
              alignment: TextAlign.center,
              text: "Sesi Telah Berakhir",
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
            AppTextLabel(
              alignment: TextAlign.center,
              text: "Lakukan kembali login untuk melanjutkan akses.",
              fontSize: 14.sp,
              fontWeight: FontWeight.w300,
            ),
            SizedBox(height: 16.h),
            Assets.images.dummy.outsideComfortZone.svg(
              width: 150.w,
              height: 150.h,
            ),
            SizedBox(height: 40.h),
            AppButton(
              color: AppColors.danger,
              height: 48.h,
              title: "Kembali ke Login",
              onPressed: () {
                // getIt<LocalStorage>().clearToken();
                // getIt<LocalStorage>().clearAll();
                // // context.maybePop();
                // context.router.replaceAll([LoginRoute()]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
