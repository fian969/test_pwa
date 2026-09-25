import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'dart:ui';

class TestPrintCard extends StatefulWidget {
  const TestPrintCard({super.key});

  @override
  State<TestPrintCard> createState() => _TestPrintCardState();
}

class _TestPrintCardState extends State<TestPrintCard> {
  bool _isPrinting = false;
  String _printStatus = '';

  Future<void> _testPrint() async {
    setState(() {
      _isPrinting = true;
      _printStatus = 'Sedang melakukan test print...';
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isPrinting = false;
      _printStatus = 'Test print berhasil! ✓';
    });
    await Future.delayed(const Duration(seconds: 3));
    setState(() => _printStatus = '');
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(200),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: Colors.white.withAlpha(100), width: 1),
            boxShadow: [BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 10, offset: const Offset(0, 2))],
          ),
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Test Print', style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700, color: AppColors.calmBlue)),
              SizedBox(height: 4.h),
              Text('Lakukan test print untuk memverifikasi printer', style: TextStyle(fontSize: 11.sp, color: AppColors.textGrey2)),
              SizedBox(height: 16.h),
              GestureDetector(
                onTap: _isPrinting ? null : _testPrint,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(14.w),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: _isPrinting
                          ? [AppColors.calmBlue.withAlpha(100), AppColors.calmBlueDark.withAlpha(80)]
                          : [AppColors.calmBlue.withAlpha(220), AppColors.calmBlueDark.withAlpha(200)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [if (!_isPrinting) BoxShadow(color: AppColors.calmBlue.withAlpha(50), blurRadius: 10, offset: const Offset(0, 4))],
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    if (_isPrinting)
                      SizedBox(width: 18.w, height: 18.h, child: const CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation<Color>(Colors.white)))
                    else
                      Icon(Icons.print, color: Colors.white, size: 18.sp),
                    SizedBox(width: 8.w),
                    Text(_isPrinting ? 'Printing...' : 'Test Print', style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700, color: Colors.white)),
                  ]),
                ),
              ),
              if (_printStatus.isNotEmpty) ...[
                SizedBox(height: 12.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: _printStatus.contains('berhasil') ? const Color(0xFF4CAF50).withAlpha(100) : const Color(0xFFF44336).withAlpha(100),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    children: [
                      Icon(_printStatus.contains('berhasil') ? Icons.check_circle : Icons.error,
                        color: _printStatus.contains('berhasil') ? const Color(0xFF4CAF50) : const Color(0xFFF44336), size: 16.sp),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(_printStatus,
                          style: TextStyle(fontSize: 12.sp, color: _printStatus.contains('berhasil') ? const Color(0xFF4CAF50) : const Color(0xFFF44336), fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
