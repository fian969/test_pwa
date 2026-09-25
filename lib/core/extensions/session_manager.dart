import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static const _kLastMac = 'last_printer_mac';
  static const _kLastName = 'last_printer_name';
  static const _kIsLoggedIn = 'is_logged_in';
  static const _kDarkMode = 'dark_mode';

  Future<void> saveLastPrinter({required String mac, String? name}) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString(_kLastMac, mac);
    if (name != null) await sp.setString(_kLastName, name);
  }

  Future<String?> loadLastPrinterMac() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getString(_kLastMac);
  }

  Future<String?> loadLastPrinterName() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getString(_kLastName);
  }

  Future<void> clearLastPrinter() async {
    final sp = await SharedPreferences.getInstance();
    await sp.remove(_kLastMac);
    await sp.remove(_kLastName);
  }

  Future<void> setLoginStatus(bool value) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setBool(_kIsLoggedIn, value);
  }

  Future<bool> isLoggedIn() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getBool(_kIsLoggedIn) ?? false;
  }

  Future<void> clearLoginStatus() async {
    final sp = await SharedPreferences.getInstance();
    await sp.remove(_kIsLoggedIn);
  }

  Future<void> setDarkMode(bool value) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setBool(_kDarkMode, value);
  }

  Future<bool> isDarkMode() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getBool(_kDarkMode) ?? false;
  }

  Future<void> clearDarkMode() async {
    final sp = await SharedPreferences.getInstance();
    await sp.remove(_kDarkMode);
  }
}
