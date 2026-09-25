import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DemoHeader extends StatelessWidget {
  const DemoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Print Service Demo', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700)),
        SizedBox(height: 4.h),
        Text('Periksa status Bluetooth, printer terpasang, dan lakukan test print', style: TextStyle(fontSize: 13.sp, color: Colors.grey)),
        SizedBox(height: 16.h),
      ],
    );
  }
}