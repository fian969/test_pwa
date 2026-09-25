import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  /// Paksa konversi ke WIB (UTC+7), terlepas dari timezone device
  DateTime get adjustedWIB => toUtc().add(const Duration(hours: 7));

  /// Formatter umum yang fleksibel
  /// Contoh:
  ///   date.formatDate();                                   // "27 November 2025"
  ///   date.formatDate(pattern: "dd/MM/yyyy");             // "27/11/2025"
  ///   date.formatDate(pattern: "EEEE, dd MMM yyyy");      // "Kamis, 27 Nov 2025"
  String formatDate({
    String pattern = "dd MMMM yyyy",
    String locale = "id_ID",
  }) {
    return DateFormat(pattern, locale).format(adjustedWIB);
  }

  /// Format umum: "27 November 2025, 10:54 WIB"
  /// Bisa diatur pattern tanggal & jam-nya
  String toFormattedId({
    String datePattern = 'dd MMMM yyyy',
    String timePattern = 'HH:mm',
    String locale = 'id_ID',
    bool withTime = true,
    bool withWib = true,
  }) {
    try {
      final wib = adjustedWIB;
      final datePart = DateFormat(datePattern, locale).format(wib);

      if (!withTime) return datePart;

      final timePart = DateFormat(timePattern, locale).format(wib);
      final suffix = withWib ? ' WIB' : '';

      return '$datePart, $timePart$suffix';
    } catch (e) {
      return 'Invalid date format';
    }
  }

  /// 🔹 Hanya waktu saja, contoh: "10:54 WIB"
  String get toTimeWib {
    final time = formatDate(pattern: 'HH:mm');
    return '$time WIB';
  }

  /// Contoh: "05/02/2025"
  String get toSlashFormat => formatDate(pattern: "dd/MM/yyyy");

  /// Contoh: "2025-02-05"
  String get toDashFormat => formatDate(pattern: "yyyy-MM-dd");

  /// Contoh: "Tuesday, 05 February 2025"
  String get toFullDateFormat =>
      formatDate(pattern: "EEEE, dd MMMM yyyy");

  /// Contoh: "15:30:45 WIB"
  String get toTimeFormat =>
      "${formatDate(pattern: "HH:mm:ss")} WIB";

  /// Contoh: "05 Feb 2025, 15:30 WIB"
  String get toDateTimeFormat =>
      "${formatDate(pattern: "dd MMM yyyy, HH:mm")} WIB";

  /// Contoh: "05/02/2025 17:30 WIB"
  String get toDateTimeWithSlashFormat =>
      "${formatDate(pattern: "dd/MM/yyyy HH:mm")} WIB";
}
