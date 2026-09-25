import 'package:flutter/widgets.dart';

class AppColors {
  AppColors._();

  // Calm blue palette for modern navigation and glass UI accents.
  static Color calmBlue = const Color(0xFF4F7ACB);
  static Color calmBlueLight = const Color(0xFF7EB9F2);
  static Color calmBlueDark = const Color(0xFF325C9E);
  static Color calmBlueMuted = const Color(0xFF8FA5C6);

  static Gradient calmBlueGradient = const LinearGradient(
    colors: [Color(0xFF5C89D8), Color(0xFF3E67B5)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static Gradient glassBlueGradient = const LinearGradient(
    colors: [Color(0xD9FFFFFF), Color(0xBFDDEAFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static Color primary = const Color.fromARGB(255, 46, 37, 128);
  static Gradient primaryGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static Gradient bgColorOnboarding = LinearGradient(
    colors: [primary.withValues(alpha: 0.72), white],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: const [0.3, 1.0],
  );

  static Gradient colorFloatingButton = LinearGradient(
    colors: [secondary, primary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static Color secondary = const Color(0xFFF5BE41);
  static Color tersier = const Color(0xFF31A9B8);
  static Color black = const Color(0xFF000000);
  static Color white = const Color(0xFFFFFFFF);
  static Color blue = const Color(0xFF0077FF);
  static Color red = const Color(0xFFFF0000);
  static Color green = const Color(0xFF44AE44);
  static Color background = const Color(0xFFF2F2F2);
  static Color grey1 = const Color(0xFF757575);
  static Color grey2 = const Color(0xFFD6D6D6);
  static Color grey3 = const Color(0xFFFAFAFA);

  static Color iconBlack = const Color(0xFF292D32);
  static Color textBlack = const Color(0xFF050608);
  static Color textWhite = const Color(0xFFFFFFFF);
  static Color textGrey1 = const Color(0xFF909090);
  static Color textGrey2 = const Color(0xFF606060);
  static Color textGrey3 = const Color(0xFF303030);
  static Color textRed = const Color(0xFFFF0303);
  static Color textYellow = const Color(0xFFFFC400);
  static Color textGreen = const Color(0xFF44AE44);
  static Color textBlue = const Color(0xFF0077FF);

  static Color textBlueProfile = const Color(0xFF0AADE7);

  static Color danger = const Color(0xFFBF362B);
  static Color bgDanger = const Color(0xFFBF362B).withValues(alpha: 0.24);
  static Color warning = const Color(0xFFFFEA00);
  static Color success = const Color(0xFF009355);
  static Color bgSuccess = const Color(0xFF009355).withValues(alpha: 0.24);

  static Color iconGreen = const Color(0xFF44AE44);
  static Color iconGreenDark = const Color(0xFF188E0F);
}
