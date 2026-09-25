import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/features/profile/presentation/widgets/profile_stat_card.dart';

class ProfileStatistics extends StatelessWidget {
  final bool isDarkMode;

  const ProfileStatistics({
    super.key,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ProfileStatCard(
            isDarkMode: isDarkMode,
            icon: Icons.folder_open,
            label: 'Total Fitur',
            value: '10',
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: ProfileStatCard(
            isDarkMode: isDarkMode,
            icon: Icons.book,
            label: 'Dibaca',
            value: '6',
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: ProfileStatCard(
            isDarkMode: isDarkMode,
            icon: Icons.check_circle,
            label: 'Diselesaikan',
            value: '3',
          ),
        ),
      ],
    );
  }
}
