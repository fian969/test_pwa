import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/features/history/presentation/widgets/history_item_card.dart';
import 'package:flutter_setup_clean_architectute/features/history/presentation/models/history_models.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final List<HistoryItem> _historyItems = [
    HistoryItem(
      featureName: 'Print Service',
      action: 'Dibuka',
      timestamp: DateTime.now(),
      category: 'Utils',
    ),
    HistoryItem(
      featureName: 'Calendar Picker',
      action: 'Dibaca',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      category: 'Widgets',
    ),
    HistoryItem(
      featureName: 'Alert Dialog',
      action: 'Dicoba',
      timestamp: DateTime.now().subtract(const Duration(hours: 5)),
      category: 'Widgets',
    ),
    HistoryItem(
      featureName: 'Snackbar Helper',
      action: 'Dibuka',
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      category: 'Utils',
    ),
    HistoryItem(
      featureName: 'App Button',
      action: 'Dibaca',
      timestamp: DateTime.now().subtract(const Duration(days: 2)),
      category: 'Widgets',
    ),
    HistoryItem(
      featureName: 'Session Manager',
      action: 'Dicoba',
      timestamp: DateTime.now().subtract(const Duration(days: 3)),
      category: 'Utils',
    ),
  ];

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m yang lalu';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h yang lalu';
    } else if (difference.inDays == 1) {
      return 'Kemarin';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} hari yang lalu';
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Text(
              'Contoh History',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.calmBlue,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(16.w),
            itemCount: _historyItems.length,
            itemBuilder: (context, index) {
              final item = _historyItems[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: HistoryItemCard(
                  item: item,
                  formattedTime: _formatTime(item.timestamp),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
