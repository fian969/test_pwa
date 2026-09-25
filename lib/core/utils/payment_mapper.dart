// // Helper: parse berbagai bentuk string ke enum PaymentMethod
// import 'package:pos/core/extensions/payment.dart';

// PaymentMethod paymentMethodFromJson(
//   Object? value, {
//   PaymentMethod fallback = PaymentMethod.cash,
// }) {
//   if (value == null) return fallback;

//   final s = value
//       .toString()
//       .trim()
//       .toLowerCase()
//       .replaceAll(' ', '')
//       .replaceAll('_', '')
//       .replaceAll('-', ''); // tambah jaga-jaga

//   switch (s) {
//     case 'cash':
//     case 'tunai':
//       return PaymentMethod.cash;
//     case 'noncash':
//     case 'nontunai':
//       return PaymentMethod.nonCash;
//     case 'noncashpayment':
//       return PaymentMethod.nonCash;
//     case 'qris':
//       return PaymentMethod.qris;
//     default:
//       return fallback; // tetap aman ke cash kalau nggak dikenal
//   }
// }
