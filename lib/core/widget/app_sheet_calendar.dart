import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/core/widget/app_button.dart';
import 'package:flutter_setup_clean_architectute/core/widget/app_text_label.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSheetCalendar {
  static Future<DateTime?> show({
    required BuildContext context,
    DateTime? initialDate,
    DateTime? firstDay,
    DateTime? lastDay,
    Function(DateTime, DateTime)? onDaySelected,
  }) async {
    DateTime selectedDate = initialDate ?? DateTime.now();
    DateTime focusedDate = initialDate ?? DateTime.now();

    final DateTime? result = await showModalBottomSheet<DateTime>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 60.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  const AppTextLabel(text: "Pilih Tanggal"),
                  TableCalendar(
                    firstDay: firstDay ?? DateTime(2000),
                    lastDay: lastDay ?? DateTime(2100),
                    focusedDay: focusedDate,
                    selectedDayPredicate: (day) {
                      return isSameDay(selectedDate, day);
                    },
                    locale: 'id_ID',
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary),
                        shape: BoxShape.circle,
                      ),
                      todayTextStyle: TextStyle(
                        color: AppColors.primary,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      weekendTextStyle: TextStyle(color: AppColors.textRed),
                      defaultTextStyle: TextStyle(fontSize: 14.sp),
                    ),
                    onDaySelected: (selected, focused) {
                      setState(() {
                        selectedDate = selected;
                        focusedDate = focused;
                      });

                      if (onDaySelected != null) {
                        onDaySelected(selected, focused);
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  AppButton(
                    onPressed: () => context.router.maybePop(selectedDate),
                    title: 'Pilih Tanggal',
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          );
        });
      },
    );

    return result;
  }
}
