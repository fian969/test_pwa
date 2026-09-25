import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/gen/assets.gen.dart';
class AppFieldUpload extends StatelessWidget {
  final String hint;
  final SvgGenImage? icon;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final String? tempData;
  final double fontSize;
  final bool isValid;
  final String? errorMessage;

  const AppFieldUpload({
    super.key,
    required this.hint,
    this.icon,
    this.onPressed,
    this.onLongPressed,
    this.tempData,
    this.fontSize = 14,
    this.isValid = true,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onPressed,
          onLongPress: onLongPressed,
          child: Container(
            height: 48.h,
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                color: isValid ? AppColors.grey1 : AppColors.red,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    tempData != null ? tempData ?? hint : hint,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: fontSize.sp,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: tempData != null
                          ? FontWeight.w500
                          : FontWeight.normal,
                      color: tempData != null
                          ? AppColors.black
                          : AppColors.textGrey1,
                    ),
                  ),
                ),
                if (icon != null)
                  Row(
                    children: [
                      SizedBox(width: 8.w),
                      icon!.svg(
                        height: 20,
                        width: 20,
                        colorFilter: ColorFilter.mode(
                          AppColors.textGrey1,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
        if (!isValid && tempData == null && errorMessage != null)
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Text(
              errorMessage ?? 'Form tidak boleh kosong',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w900),
            ),
          ),
      ],
    );
  }
}
