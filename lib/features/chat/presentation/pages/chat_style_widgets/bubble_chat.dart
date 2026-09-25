import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/features/chat/presentation/models/chat_models.dart';
import 'package:flutter_setup_clean_architectute/features/chat/presentation/widgets/chat_input_field.dart';
import 'dart:ui';

class BubbleChat extends StatelessWidget {
  final List<ChatMessage> messages;
  final TextEditingController messageController;
  final VoidCallback onSendMessage;

  const BubbleChat({
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
              return _MessageBubble(message: message);
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

class _MessageBubble extends StatelessWidget {
  final ChatMessage message;

  const _MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        mainAxisAlignment: message.isUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Container(
                  decoration: BoxDecoration(
                    color: message.isUser
                        ? AppColors.calmBlue.withAlpha(220)
                        : Colors.white.withAlpha(200),
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: Colors.white.withAlpha(100),
                      width: 1,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 10.h,
                  ),
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
                        ),
                      ),
                      SizedBox(height: 4.h),
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
