
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';

import '../../gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final double iconSize;
  final double radius;
  final bool isPrimary;
  final bool isTask;
  final bool isIconLeft;
  final bool isIconRight;
  final SvgGenImage? icon;
  final Color? color;
  final Color? colorTitle;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? elevation;
  final BorderSide? side;

  const AppButton({
    super.key,
    required this.title,
    this.onPressed,
    this.isPrimary = true,
    this.isTask = false,
    this.height,
    this.width,
    this.fontSize,
    this.fontWeight,
    this.elevation,
    this.side,
    this.color,
    this.colorTitle,
    this.isIconLeft = false,
    this.icon,
    this.iconSize = 14,
    this.radius = 8,
    this.isIconRight = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height ?? 56.h,
      minWidth: width ?? double.infinity,
      color: color ?? AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius).r,
        side: side ?? BorderSide.none,
      ),
      onPressed: onPressed,
      disabledColor: AppColors.grey2,
      elevation: elevation,
      padding: EdgeInsets.only(left: isTask ? 24.w : 0.w),
      child: Row(
        mainAxisAlignment:
            isTask ? MainAxisAlignment.start : MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isIconLeft)
            Row(
              children: [
                icon!.svg(
                    width: iconSize.w,
                    height: iconSize.w,
                    colorFilter: ColorFilter.mode(
                        colorTitle ?? AppColors.white, BlendMode.srcIn)),
                SizedBox(width: isTask ? 8.w : 4.w),
              ],
            ),
          Text(
            title,
            style: TextStyle(
              fontSize: fontSize ?? 14.sp,
              fontWeight: fontWeight ?? FontWeight.bold,
              color: colorTitle ?? AppColors.white,
            ),
          ),
          if (isIconRight)
            Row(
              children: [
                SizedBox(width: 4.w),
                icon!.svg(
                    width: iconSize.w,
                    height: iconSize.w,
                    colorFilter: ColorFilter.mode(
                        colorTitle ?? AppColors.white, BlendMode.srcIn)),
              ],
            ),
        ],
      ),
    );
  }
}
