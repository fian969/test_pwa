import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class RupiahFormatter extends TextInputFormatter {
  final NumberFormat _formatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 0,
  );

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return const TextEditingValue(text: '');
    }
    if (newValue.text == 'Rp' ||
        newValue.text == 'Rp ' ||
        newValue.text == 'Rp0') {
      return const TextEditingValue(text: '');
    }
    String numericValue = newValue.text.replaceAll(RegExp(r'\D'), '');
    if (numericValue.isEmpty || numericValue == '0') {
      return const TextEditingValue(text: '');
    }
    final int? value = int.tryParse(numericValue);
    if (value == null) {
      return oldValue;
    }

    final newText = _formatter.format(value);

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
