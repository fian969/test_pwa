import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/features/chat/presentation/models/chat_models.dart';
import 'package:flutter_setup_clean_architectute/features/chat/presentation/widgets/chat_input_field.dart';
import 'dart:ui';

class SupportChat extends StatelessWidget {
  final List<ChatMessage> messages;
  final TextEditingController messageController;
  final VoidCallback onSendMessage;

  const SupportChat({
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
              return _SupportChatBubble(message: message, index: index);
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

class _SupportChatBubble extends StatelessWidget {
  final ChatMessage message;
  final int index;

  const _SupportChatBubble({
    required this.message,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: message.isUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          if (!message.isUser)
            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Row(
                children: [
                  Container(
                    width: 28.w,
                    height: 28.h,
                    decoration: BoxDecoration(
                      color: AppColors.calmBlue.withAlpha(150),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Icon(
                      Icons.support_agent,
                      color: Colors.white,
                      size: 14.sp,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tim Support',
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.calmBlue,
                        ),
                      ),
                      Text(
                        'ID: #${2024 + index}',
                        style: TextStyle(
                          fontSize: 9.sp,
                          color: AppColors.textGrey2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                constraints: BoxConstraints(maxWidth: 300.w),
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
                        fontSize: 12.sp,
                        color: message.isUser
                            ? Colors.white
                            : AppColors.calmBlue,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 12.sp,
                          color: message.isUser
                              ? Colors.white70
                              : AppColors.grey1,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          '${message.timestamp.hour}:${message.timestamp.minute.toString().padLeft(2, '0')}',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: message.isUser
                                ? Colors.white70
                                : AppColors.grey1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
