import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextLabel extends StatelessWidget {
  final double? fontSize;
  final TextAlign? alignment;
  final FontWeight fontWeight;
  final Color color;
  final String text;
  final int maxLines;

  const AppTextLabel({
    super.key,
    this.fontSize,
    this.alignment,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    required this.text,
    this.maxLines = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign: alignment,
      style: TextStyle(
        fontSize: fontSize ?? 14.sp,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
