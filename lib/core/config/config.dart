class AppConfig {
  // ubah ini saja
  static const bool isStaging = false;

  static const String baseHost = 'http://192.168.1.42:3000';
  static const String stagingHost = 'https://bioris-itdev.ethos.co.id';

  static String get host => isStaging ? stagingHost : baseHost;
  static String get apiBaseUrl => '$host/api';

  static String get defaultImage => '$host/uploads/default.png';
}
