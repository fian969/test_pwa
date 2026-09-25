import 'package:flutter_setup_clean_architectute/core/widget/app_dialog.dart';

import '../utils/snackbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

extension ContextExt on BuildContext {
  Object? get routeArguments => ModalRoute.of(this)?.settings.arguments;

  showError(String message) {
    loaderOverlay.hide();
    SnackBarHelper.showSnackBarError(this, message);
  }

  successMessage(String message) {
    loaderOverlay.hide();
    SnackBarHelper.showSnackBarSuccess(this, message);
  }

  void snackBarError(String message) {
    SnackBarHelper.showSnackBarError(this, message);
  }

  snackBarSuccess(String message) {
    SnackBarHelper.showSnackBarSuccess(this, message);
  }

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  showLoading() => loaderOverlay.show();

  hideLoading() => loaderOverlay.hide();

  // void showConfirmDialog(DialogUIModel model) {
  //   showDialog(context: this, builder: (_) => AppDialogUI(model: model));
  // }

  void showConfirmDialog(DialogUIMode model) {
    showDialog(
      context: this,
      builder: (_) => AppDialog(model: model),
    );
  }

  showBottomSheet(
    Widget child, {
    BoxConstraints? constraints,
    bool isDismissible = true,
    bool isEnableDrag = true,
  }) async {
    hideLoading();
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      constraints: constraints,
      context: this,
      builder: (context) => child,
      isScrollControlled: true,
      isDismissible: isDismissible,
      enableDrag: isEnableDrag,
    );
  }

  push(Widget child) =>
      Navigator.push(this, MaterialPageRoute(builder: (_) => child));
}
