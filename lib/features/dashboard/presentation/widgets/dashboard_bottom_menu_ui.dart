import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/core/utils/dashboard_helper.dart';
import 'package:flutter_setup_clean_architectute/gen/assets.gen.dart';

class DashboardBottomMenuUI extends StatelessWidget {
  final int page;
  final ValueChanged<int> onChanged;
  final VoidCallback onQrTap;

  const DashboardBottomMenuUI({
    super.key,
    required this.page,
    required this.onChanged,
    required this.onQrTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
        child: SizedBox(
          height: 84.h,
          child: Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.calmBlueDark.withValues(alpha: 0.16),
                      blurRadius: 28.r,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28.r),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: AppColors.glassBlueGradient,
                        border: Border.all(
                          color: AppColors.white.withValues(alpha: 0.74),
                          width: 1.1,
                        ),
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),
                        child: BottomNavigationBar(
                          currentIndex: page,
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          type: BottomNavigationBarType.fixed,
                          iconSize: 22.h,
                          selectedFontSize: 0,
                          unselectedFontSize: 0,
                          showSelectedLabels: false,
                          showUnselectedLabels: false,
                          items: DashboardMenu.values
                              .map(
                                (e) => BottomNavigationBarItem(
                                  icon: Padding(
                                    padding: EdgeInsets.only(
                                      top: 8.h,
                                      bottom: 8.h,
                                    ),
                                    child: e.icon.svg(
                                      width: 22.w,
                                      height: 22.w,
                                      colorFilter: ColorFilter.mode(
                                        AppColors.calmBlueMuted,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                  activeIcon: Padding(
                                    padding: EdgeInsets.only(
                                      top: 8.h,
                                      bottom: 4.h,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        e.iconActive.svg(
                                          width: 22.w,
                                          height: 22.w,
                                          colorFilter: ColorFilter.mode(
                                            AppColors.calmBlueDark,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                        SizedBox(height: 6.h),
                                        Container(
                                          width: 5.w,
                                          height: 5.w,
                                          decoration: BoxDecoration(
                                            gradient:
                                                AppColors.calmBlueGradient,
                                            borderRadius: BorderRadius.circular(
                                              100.r,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  label: '',
                                ),
                              )
                              .toList(),
                          onTap: onChanged,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -8.h,
                child: GestureDetector(
                  onTap: onQrTap,
                  child: Container(
                    width: 58.w,
                    height: 58.w,
                    decoration: BoxDecoration(
                      gradient: AppColors.calmBlueGradient,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.white, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.calmBlueDark.withValues(alpha: 0.32),
                          blurRadius: 16.r,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Assets.icons.broken.frame.svg(
                      width: 24.w,
                      height: 24.w,
                      colorFilter: ColorFilter.mode(
                        AppColors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
