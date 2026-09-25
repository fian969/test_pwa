import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/presentation/widgets/common_widgets.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/presentation/widgets/bluetooth_status_card.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/presentation/widgets/demo_header.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/presentation/widgets/printer_list_card.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/presentation/widgets/section_step.dart' show SectionStep;
import 'package:flutter_setup_clean_architectute/features/documentation/presentation/widgets/test_print_card.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/presentation/widgets/tips_section.dart';

class PrintServiceDemoPage extends StatelessWidget {
  const PrintServiceDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: DetailAppBar(
        title: 'Print Service',
        onBack: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DemoHeader(),
            SizedBox(height: 24.h),
            const SectionStep(title: '1. Status Bluetooth', child: BluetoothStatusCard()),
            SizedBox(height: 24.h),
            const SectionStep(title: '2. Printer Terpasang', child: PrinterListCard()),
            SizedBox(height: 24.h),
            const SectionStep(title: '3. Test Print', child: TestPrintCard()),
            SizedBox(height: 24.h),
            const TipsSection(),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
