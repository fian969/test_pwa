import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/features/chat/presentation/models/chat_models.dart';
import 'package:flutter_setup_clean_architectute/features/chat/presentation/widgets/chat_input_field.dart';
import 'dart:ui';

class AIChat extends StatelessWidget {
  final List<ChatMessage> messages;
  final TextEditingController messageController;
  final VoidCallback onSendMessage;

  const AIChat({
    super.key,
    required this.messages,
    required this.messageController,
    required this.onSendMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(16.w),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              return _AIChatBubble(message: message);
            },
          ),
        ),
        ChatInputField(
          controller: messageController,
          onSend: onSendMessage,
        ),
      ],
    );
  }
}

class _AIChatBubble extends StatelessWidget {
  final ChatMessage message;

  const _AIChatBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        mainAxisAlignment: message.isUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!message.isUser)
            Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: Container(
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.calmBlue.withAlpha(220),
                      AppColors.calmBlueDark.withAlpha(200),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.smart_toy,
                  color: Colors.white,
                  size: 16.sp,
                ),
              ),
            ),
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Container(
                  decoration: BoxDecoration(
                    color: message.isUser
                        ? AppColors.calmBlue.withAlpha(220)
                        : Colors.white.withAlpha(200),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: Colors.white.withAlpha(100),
                      width: 1,
                    ),
                  ),
                  padding: EdgeInsets.all(12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message.message,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: message.isUser
                              ? Colors.white
                              : AppColors.calmBlue,
                          height: 1.5,
                        ),
                      ),
                      if (!message.isUser) ...[
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.thumb_up_outlined,
                              size: 14.sp,
                              color: AppColors.calmBlueLight,
                            ),
                            SizedBox(width: 8.w),
                            Icon(
                              Icons.thumb_down_outlined,
                              size: 14.sp,
                              color: AppColors.textGrey2,
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (message.isUser) SizedBox(width: 8.w),
        ],
      ),
    );
  }
}
