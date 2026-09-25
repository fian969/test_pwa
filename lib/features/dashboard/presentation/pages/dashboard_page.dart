import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/features/chat/presentation/pages/chat_page.dart';
import 'package:flutter_setup_clean_architectute/features/dashboard/presentation/widgets/qr_action_show.dart';
import 'package:flutter_setup_clean_architectute/features/history/presentation/pages/history_page.dart';
import 'package:flutter_setup_clean_architectute/features/dashboard/presentation/pages/home_page.dart';
import 'package:flutter_setup_clean_architectute/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter_setup_clean_architectute/features/dashboard/presentation/widgets/dashboard_bottom_menu_ui.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  final int pageIndex;
  const DashboardPage({super.key, this.pageIndex = 0});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late int _page;

  @override
  void initState() {
    _page = widget.pageIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      extendBody: true,
      body: _pages[_page],
      bottomNavigationBar: DashboardBottomMenuUI(
        page: _page,
        onChanged: (v) => setState(() => _page = v),
        onQrTap: _showQrActionSheet,
      ),
    );
  }

  Future<void> _showQrActionSheet() async {
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return const QrActionShow();
      },
    );
  }

  List<Widget> get _pages => [
    const HomePage(),
    const ChatPage(),
    const HistoryPage(),
    const ProfilePage(),
  ];
}
