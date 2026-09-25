import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';

import '../../gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppRowText extends StatelessWidget {
  final String leftText;
  final double? leftTextSize;
  final FontWeight? leftWeight;
  final FontWeight? rightWeight;
  final String rightText;
  final double? rightTextSize;
  final Color? rightTextColor;
  final String rightTextBottom;
  final Color? leftTextColor;
  final bool isCopy;
  final bool isInvoice;

  const AppRowText({
    super.key,
    required this.leftText,
    required this.rightText,
    this.leftTextSize,
    this.leftWeight,
    this.rightTextSize,
    this.rightTextColor,
    this.leftTextColor,
    this.rightWeight,
    this.rightTextBottom = "",
    this.isCopy = false,
    this.isInvoice = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: isInvoice ? CrossAxisAlignment.end : CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            leftText,
            style: TextStyle(
              fontSize: leftTextSize ?? 12.sp,
              color: leftTextColor ?? AppColors.primary,
              fontWeight: leftWeight ?? FontWeight.normal,
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  rightText,
                  style: TextStyle(
                    fontSize: rightTextSize ?? 16.sp,
                    color: rightTextColor ?? AppColors.primary,
                    fontWeight: rightWeight ?? FontWeight.bold,
                  ),
                ),
                if (isCopy)
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: GestureDetector(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: rightText));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Teks berhasil disalin!'),
                          ),
                        );
                      },
                      child: Assets.icons.bank.bankBca
                          .svg(colorFilter: _colorIcon, height: 16, width: 16),
                    ),
                  )
              ],
            ),
            if (rightTextBottom != "")
              Text(
                rightTextBottom,
                style: TextStyle(
                  fontSize: rightTextSize ?? 16.sp,
                  color: rightTextColor ?? AppColors.primary,
                  fontWeight: rightWeight ?? FontWeight.bold,
                ),
              ),
          ],
        ),
      ],
    );
  }

  ColorFilter? get _colorIcon => ColorFilter.mode(
        AppColors.textGrey1,
        BlendMode.srcIn,
      );
}
