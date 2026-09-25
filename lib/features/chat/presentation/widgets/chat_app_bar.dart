import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/features/chat/presentation/models/chat_models.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ChatStyle chatStyle;
  final VoidCallback onBackPressed;

  const ChatAppBar({
    super.key,
    required this.chatStyle,
    required this.onBackPressed,
  });

  String _getChatStyleName(ChatStyle style) {
    switch (style) {
      case ChatStyle.bubble:
        return 'Chat Bubble';
      case ChatStyle.marketplace:
        return 'Chat Marketplace';
      case ChatStyle.ai:
        return 'Chat AI';
      case ChatStyle.support:
        return 'Chat Support';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: Row(
          children: [
            GestureDetector(
              onTap: onBackPressed,
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.calmBlue.withAlpha(150),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 18.sp,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Text(
              _getChatStyleName(chatStyle),
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.calmBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
