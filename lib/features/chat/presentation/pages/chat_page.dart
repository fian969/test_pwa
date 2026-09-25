import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/features/chat/presentation/pages/chat_detail_page.dart';
import 'package:flutter_setup_clean_architectute/features/chat/presentation/models/chat_models.dart';
import 'package:flutter_setup_clean_architectute/features/chat/presentation/widgets/chat_style_card.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chatStyles = [
      {
        'style': ChatStyle.bubble,
        'name': 'Chat Bubble',
        'description': 'Gaya chat klasik dengan bubble berlapis',
        'icon': Icons.chat_bubble_outline,
        'color': AppColors.calmBlue,
      },
      {
        'style': ChatStyle.marketplace,
        'name': 'Chat Marketplace',
        'description': 'Chat dengan tampilan toko produk',
        'icon': Icons.storefront_outlined,
        'color': AppColors.calmBlueLight,
      },
      {
        'style': ChatStyle.ai,
        'name': 'Chat AI',
        'description': 'Antarmuka assistant AI modern',
        'icon': Icons.smart_toy_outlined,
        'color': AppColors.calmBlueDark,
      },
      {
        'style': ChatStyle.support,
        'name': 'Chat Support',
        'description': 'Chat support profesional dengan detail',
        'icon': Icons.support_agent_outlined,
        'color': AppColors.calmBlueMuted,
      },
    ];

    return Column(
      children: [
        SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Text(
              'Pilih Gaya Chat',
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
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            itemCount: chatStyles.length,
            itemBuilder: (context, index) {
              final style = chatStyles[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: ChatStyleCard(
                  style: style,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatDetailPage(
                          chatStyle: style['style'] as ChatStyle,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
