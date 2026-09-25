import 'package:intl/intl.dart';

extension RupiahDisplayX on num {
  /// Format angka langsung ke Rupiah (tanpa konversi)
  String toRupiah({int decimalDigits = 0}) {
    final fmt = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: decimalDigits,
    );
    return fmt.format(this);
  }

  /// Konversi USD -> IDR lalu format Rupiah
  String usdToIdr({double rate = 16000, int decimalDigits = 0}) {
    final idr = this * rate;
    final fmt = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: decimalDigits,
    );
    return fmt.format(idr);
  }
}
