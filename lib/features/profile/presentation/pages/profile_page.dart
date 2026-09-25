import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/core/extensions/session_manager.dart';
import 'package:flutter_setup_clean_architectute/features/profile/presentation/widgets/profile_header.dart';
import 'package:flutter_setup_clean_architectute/features/profile/presentation/widgets/profile_statistics.dart';
import 'package:flutter_setup_clean_architectute/features/profile/presentation/widgets/profile_settings_section.dart';
import 'package:flutter_setup_clean_architectute/features/profile/presentation/widgets/profile_about_section.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final _sessionManager = SessionManager();
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadDarkModeSetting();
  }

  void _loadDarkModeSetting() async {
    final isDarkMode = await _sessionManager.isDarkMode();
    setState(() {
      _darkModeEnabled = isDarkMode;
    });
  }

  void _toggleDarkMode(bool value) async {
    setState(() {
      _darkModeEnabled = value;
    });
    await _sessionManager.setDarkMode(value);
  }

  Color _getBackgroundColor() {
    return _darkModeEnabled ? const Color(0xFF1A1A1A) : const Color(0xFFF2F2F2);
  }

  Color _getCardBackgroundColor() {
    return _darkModeEnabled ? Colors.black.withAlpha(200) : Colors.white.withAlpha(200);
  }

  Color _getTextColor() {
    return _darkModeEnabled ? Colors.white : AppColors.calmBlue;
  }

  Color _getSubtextColor() {
    return _darkModeEnabled ? const Color(0xFFB0B0B0) : AppColors.grey1;
  }

  Color _getBorderColor() {
    return _darkModeEnabled ? Colors.white.withAlpha(50) : Colors.white.withAlpha(100);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _getBackgroundColor(),
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(16.w),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Profile Header
                ProfileHeader(
                  isDarkMode: _darkModeEnabled,
                  cardBackgroundColor: _getCardBackgroundColor(),
                  borderColor: _getBorderColor(),
                  textColor: _getTextColor(),
                  subtextColor: _getSubtextColor(),
                ),
                SizedBox(height: 24.h),

                // Statistics
                ProfileStatistics(
                  isDarkMode: _darkModeEnabled,
                ),
                SizedBox(height: 24.h),

                // Settings Section
                ProfileSettingsSection(
                  isDarkMode: _darkModeEnabled,
                  textColor: _getTextColor(),
                  notificationsEnabled: _notificationsEnabled,
                  darkModeEnabled: _darkModeEnabled,
                  onNotificationChanged: (value) {
                    setState(() {
                      _notificationsEnabled = value;
                    });
                  },
                  onDarkModeChanged: _toggleDarkMode,
                ),
                SizedBox(height: 24.h),

                // About Section
                ProfileAboutSection(
                  isDarkMode: _darkModeEnabled,
                  cardBackgroundColor: _getCardBackgroundColor(),
                  borderColor: _getBorderColor(),
                  textColor: _getTextColor(),
                  subtextColor: _getSubtextColor(),
                ),
                SizedBox(height: 32.h),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
