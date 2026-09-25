import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'dart:ui';

class PrinterListCard extends StatefulWidget {
  const PrinterListCard({super.key});

  @override
  State<PrinterListCard> createState() => _PrinterListCardState();
}

class _PrinterListCardState extends State<PrinterListCard> {
  bool _isLoading = false;
  late List<Map<String, String>> _pairedPrinters;

  @override
  void initState() {
    super.initState();
    _pairedPrinters = [];
    _checkPairedPrinters();
  }

  Future<void> _checkPairedPrinters() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _pairedPrinters = [{'name': 'Printer Thermal 1', 'address': '00:11:22:33:44:55', 'status': 'Terhubung'}];
      _isLoading = false;
    });
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Printer Terpasang', style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700, color: AppColors.calmBlue)),
                      SizedBox(height: 4.h),
                      Text('${_pairedPrinters.length} printer ditemukan', style: TextStyle(fontSize: 11.sp, color: AppColors.textGrey2)),
                    ],
                  ),
                  GestureDetector(
                    onTap: _isLoading ? null : _checkPairedPrinters,
                    child: _isLoading
                        ? SizedBox(width: 20.w, height: 20.h, child: CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation<Color>(AppColors.calmBlue)))
                        : Icon(Icons.refresh, color: AppColors.calmBlue, size: 20.sp),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              if (_pairedPrinters.isEmpty)
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(color: AppColors.calmBlue.withAlpha(50), borderRadius: BorderRadius.circular(8.r)),
                  child: Column(children: [
                    Icon(Icons.devices_other, color: AppColors.calmBlue, size: 32.sp),
                    SizedBox(height: 8.h),
                    Text('Tidak ada printer yang terpasang', style: TextStyle(fontSize: 12.sp, color: AppColors.calmBlue, fontWeight: FontWeight.w600)),
                  ]),
                )
              else
                Column(children: List.generate(_pairedPrinters.length, (i) => _PrinterItemSimple(_pairedPrinters[i]))),
            ],
          ),
        ),
      ),
    );
  }
}

class _PrinterItemSimple extends StatelessWidget {
  final Map<String, String> printer;
  const _PrinterItemSimple(this.printer);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: const Color(0xFF4CAF50).withAlpha(50),
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: const Color(0xFF4CAF50).withAlpha(150), width: 1),
        ),
        child: Row(
          children: [
            Container(width: 40.w, height: 40.w, decoration: BoxDecoration(color: const Color(0xFF4CAF50).withAlpha(150), borderRadius: BorderRadius.circular(8.r)), child: Icon(Icons.print, color: Colors.white, size: 20.sp)),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(printer['name'] ?? '', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600, color: AppColors.calmBlue)),
                  SizedBox(height: 2.h),
                  Text(printer['address'] ?? '', style: TextStyle(fontSize: 10.sp, color: AppColors.textGrey2)),
                  SizedBox(height: 4.h),
                  Row(children: [
                    Container(width: 6.w, height: 6.w, decoration: const BoxDecoration(color: Color(0xFF4CAF50), shape: BoxShape.circle)),
                    SizedBox(width: 4.w),
                    Text(printer['status'] ?? '', style: TextStyle(fontSize: 10.sp, color: const Color(0xFF4CAF50), fontWeight: FontWeight.w600)),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}