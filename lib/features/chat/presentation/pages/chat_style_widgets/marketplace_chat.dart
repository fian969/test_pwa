import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/features/chat/presentation/models/chat_models.dart';
import 'package:flutter_setup_clean_architectute/features/chat/presentation/widgets/chat_input_field.dart';
import 'dart:ui';

class MarketplaceChat extends StatelessWidget {
  final List<ChatMessage> messages;
  final TextEditingController messageController;
  final VoidCallback onSendMessage;

  const MarketplaceChat({
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
              return _MarketplaceMessageBubble(message: message);
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

class _MarketplaceMessageBubble extends StatelessWidget {
  final ChatMessage message;

  const _MarketplaceMessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Column(
        crossAxisAlignment: message.isUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          if (!message.isUser)
            Padding(
              padding: EdgeInsets.only(bottom: 6.h),
              child: Text(
                'Seller Support',
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textGrey2,
                ),
              ),
            ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                constraints: BoxConstraints(maxWidth: 280.w),
                decoration: BoxDecoration(
                  color: message.isUser
                      ? AppColors.calmBlue.withAlpha(220)
                      : Colors.white.withAlpha(220),
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
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.schedule,
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
