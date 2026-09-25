import 'package:flutter/material.dart';
import 'package:flutter_setup_clean_architectute/gen/assets.gen.dart';

enum PaymentMethod {
  cash,
  nonCash,
  qris,
}

extension PaymentMethodX on PaymentMethod {
  String get label {
    switch (this) {
      case PaymentMethod.cash:
        return 'Tunai';
      case PaymentMethod.nonCash:
        return 'Non Tunai';
      case PaymentMethod.qris:
        return 'QRIS';
    }
  }

  Widget get icon {
    switch (this) {
      case PaymentMethod.cash:
        return Assets.icons.payment.cash.svg();
      case PaymentMethod.nonCash:
        return Assets.icons.payment.nonCash.svg();
      case PaymentMethod.qris:
        return Assets.icons.payment.qris.svg();
    }
  }

  static PaymentMethod? fromString(String? value) {
    if (value == null) return null;

    switch (value.trim().toLowerCase()) {
      case 'tunai':
        return PaymentMethod.cash;
      case 'non tunai':
      case 'non-tunai':
      case 'non_cash':
      case 'non cash':
        return PaymentMethod.nonCash;
      case 'qris':
        return PaymentMethod.qris;
      default:
        return null;
    }
  }
}
