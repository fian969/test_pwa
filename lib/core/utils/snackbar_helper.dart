import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SnackBarHelper {
  static void showSnackBarError(BuildContext context, String message) {
    _showToast(message, backgroundColor: AppColors.danger);
  }

  static void showSnackBarSuccess(BuildContext context, String message) {
    _showToast(message,
        backgroundColor: AppColors.green.withValues(alpha: 0.9));
  }

  static void showSnackBarCopied(BuildContext context) {
    _showToast(
      "Tersalin",
      backgroundColor: AppColors.grey2.withValues(alpha: 0.9),
      textColor: AppColors.textBlack,
    );
  }

  static void showError(String message) {
    _showToast(message, backgroundColor: AppColors.danger);
  }

  static void _showToast(String message,
      {Color? backgroundColor, Color? textColor}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: backgroundColor ?? AppColors.danger,
      textColor: textColor ?? Colors.white,
      fontSize: 12.sp,
    );
  }
}
