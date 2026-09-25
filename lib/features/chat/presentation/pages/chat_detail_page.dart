import 'package:flutter/material.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/features/chat/presentation/pages/chat_style_widgets/bubble_chat.dart';
import 'package:flutter_setup_clean_architectute/features/chat/presentation/pages/chat_style_widgets/marketplace_chat.dart';
import 'package:flutter_setup_clean_architectute/features/chat/presentation/pages/chat_style_widgets/ai_chat.dart';
import 'package:flutter_setup_clean_architectute/features/chat/presentation/pages/chat_style_widgets/support_chat.dart';
import 'package:flutter_setup_clean_architectute/features/chat/presentation/models/chat_models.dart';
import 'package:flutter_setup_clean_architectute/features/chat/presentation/widgets/chat_app_bar.dart';

class ChatDetailPage extends StatefulWidget {
  final ChatStyle chatStyle;

  const ChatDetailPage({
    super.key,
    required this.chatStyle,
  });

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final List<ChatMessage> _messages = [
    ChatMessage(
      message: 'Halo! 👋 Selamat datang di dokumentasi fitur. Ada yang bisa saya bantu?',
      isUser: false,
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
  ];

  final _messageController = TextEditingController();

  void _sendMessage() {
    if (_messageController.text.isEmpty) return;

    setState(() {
      _messages.add(ChatMessage(
        message: _messageController.text,
        isUser: true,
        timestamp: DateTime.now(),
      ));
    });

    _messageController.clear();

    // Simulate bot response
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _messages.add(ChatMessage(
            message: 'Terima kasih atas pertanyaanmu! 😊 Tim support kami akan membantu segera.',
            isUser: false,
            timestamp: DateTime.now(),
          ));
        });
      }
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: ChatAppBar(
        chatStyle: widget.chatStyle,
        onBackPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        top: false,
        child: _buildChatStyle(widget.chatStyle),
      ),
    );
  }

  Widget _buildChatStyle(ChatStyle style) {
    switch (style) {
      case ChatStyle.bubble:
        return BubbleChat(
          messages: _messages,
          messageController: _messageController,
          onSendMessage: _sendMessage,
        );
      case ChatStyle.marketplace:
        return MarketplaceChat(
          messages: _messages,
          messageController: _messageController,
          onSendMessage: _sendMessage,
        );
      case ChatStyle.ai:
        return AIChat(
          messages: _messages,
          messageController: _messageController,
          onSendMessage: _sendMessage,
        );
      case ChatStyle.support:
        return SupportChat(
          messages: _messages,
          messageController: _messageController,
          onSendMessage: _sendMessage,
        );
    }
  }
}
