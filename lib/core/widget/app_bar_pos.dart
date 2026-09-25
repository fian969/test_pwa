import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/gen/assets.gen.dart';

class AppBarPos extends StatelessWidget implements PreferredSizeWidget {
  final bool isNoBack;
  final String title;
  final bool isStore;
  final bool isCheckout;
  final SvgGenImage? icon;
  final VoidCallback? tapIcon;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;

  const AppBarPos({
    super.key,
    required this.title,
    this.actions,
    this.icon,
    this.tapIcon,
    this.isNoBack = false,
    this.isStore = false,
    this.isCheckout = false,
    this.onBackPressed,
  });

  Widget _buildBackButton(BuildContext context) {
    return isNoBack
        ? _appBarStyle
        : IconButton(
            icon: Assets.icons.broken.arrowLeft.svg(width: 20, height: 20),
            onPressed: onBackPressed ??
                () {
                  // isCheckout
                  //     ? context.showConfirmDialog(DialogUIMode(
                  //         title:
                  //             'Anda yakin untuk meninggalkan halaman checkout ini?',
                  //         iconDialog: Assets.icons.bold.logout,
                  //         onPositive: () {
                  //           context.router.popForced();
                  //           context.router.popForced(true);
                  //           context.router.popForced();
                  //         },
                  //       ))
                  //     : context.router.popForced(true);
                  // context.read<GetTransactionCubit>().getTransactions();
                },
          );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: actions,
      flexibleSpace: Container(
        decoration: BoxDecoration(color: AppColors.primary),
        child: Padding(
          padding: EdgeInsets.only(
            top: kToolbarHeight / 2,
            left: 12.w,
            right: 24.w,
          ),
          child: Row(
            children: [
              _buildBackButton(context),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 265),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: tapIcon,
                child: icon != null
                    ? icon!.svg(
                        colorFilter: _colorFilter,
                        width: 20,
                        height: 20,
                      )
                    : Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  ColorFilter? get _colorFilter =>
      ColorFilter.mode(AppColors.white, BlendMode.srcIn);

  get _appBarStyle => isStore
      ? Padding(
          padding: EdgeInsets.only(right: 8.w, left: 12.w),
          child: Assets.icons.broken.shop.svg(),
        )
      : SizedBox(width: 12.w);
}
