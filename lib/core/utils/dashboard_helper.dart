import 'package:flutter_setup_clean_architectute/gen/assets.gen.dart';

enum DashboardMenu {
  home,
  chat,
  history,
  account;

  SvgGenImage get iconActive {
    switch (this) {
      case DashboardMenu.home:
        return Assets.icons.bold.home2;
      case DashboardMenu.chat:
        return Assets.icons.bold.product;
      case DashboardMenu.history:
        return Assets.icons.bold.document;
      case DashboardMenu.account:
        return Assets.icons.bold.user;
    }
  }

  SvgGenImage get icon {
    switch (this) {
      case DashboardMenu.home:
        return Assets.icons.broken.home2;
      case DashboardMenu.chat:
        return Assets.icons.broken.shop;
      case DashboardMenu.history:
        return Assets.icons.broken.document;
      case DashboardMenu.account:
        return Assets.icons.broken.user;
    }
  }
}
