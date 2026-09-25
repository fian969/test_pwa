import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/features/profile/presentation/widgets/profile_setting_item.dart';

class ProfileSettingsSection extends StatelessWidget {
  final bool isDarkMode;
  final Color textColor;
  final bool notificationsEnabled;
  final bool darkModeEnabled;
  final Function(bool) onNotificationChanged;
  final Function(bool) onDarkModeChanged;

  const ProfileSettingsSection({
    super.key,
    required this.isDarkMode,
    required this.textColor,
    required this.notificationsEnabled,
    required this.darkModeEnabled,
    required this.onNotificationChanged,
    required this.onDarkModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pengaturan',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),
        SizedBox(height: 12.h),
        ProfileSettingItem(
          isDarkMode: isDarkMode,
          icon: Icons.notifications,
          label: 'Notifikasi',
          trailing: Switch(
            value: notificationsEnabled,
            onChanged: onNotificationChanged,
            activeTrackColor: AppColors.calmBlue.withAlpha(150),
            activeThumbColor: AppColors.calmBlue,
          ),
        ),
        ProfileSettingItem(
          isDarkMode: isDarkMode,
          icon: Icons.dark_mode,
          label: 'Mode Gelap',
          trailing: Switch(
            value: darkModeEnabled,
            onChanged: onDarkModeChanged,
            activeTrackColor: AppColors.calmBlue.withAlpha(150),
            activeThumbColor: AppColors.calmBlue,
          ),
        ),
        ProfileSettingItem(
          isDarkMode: isDarkMode,
          icon: Icons.language,
          label: 'Bahasa',
          trailing: Text(
            'Indonesia',
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.calmBlue,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
