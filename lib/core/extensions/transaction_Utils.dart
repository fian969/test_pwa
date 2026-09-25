// // import 'package:pos/features/transaction/domain/entities/cart.dart';
// import 'package:pos/features/transaction/domain/entities/cart_trx.dart';
// import 'package:pos/features/transaction/domain/entities/transaction_body.dart';

// extension TransactionCodeX on DateTime {
//   String generateTransactionCode({
//     String kasirCode = "KSR001",
//     String storeCode = "STR001",
//   }) {
//     final dd = day.toString().padLeft(2, '0');
//     final mm = month.toString().padLeft(2, '0');
//     final yy = (year % 100).toString().padLeft(2, '0');
//     final hh = hour.toString().padLeft(2, '0');
//     final mi = minute.toString().padLeft(2, '0');
//     final ss = second.toString().padLeft(2, '0');
//     return "TRX-$dd$mm$yy$hh$mi$ss-$kasirCode-$storeCode";
//   }
// }

// // extension ToBodyItem on CartProduct {
// //   TransactionBodyItem toBody() {
// //     return TransactionBodyItem(
// //       productId: idProduct,
// //       qty: qty,
// //       price: price,
// //     );
// //   }
// // }

// extension ToBodyTrxItem on CartTrxProduct {
//   TransactionBodyItem toBody() {
//     return TransactionBodyItem(
//       productId: idProduct,
//       qty: qty,
//       price: price,
//     );
//   }
// }

// extension CartTrxProductX on CartTrxProduct {
//   CartTrxProduct copyWith({
//     int? qty,
//     int? stock,
//     double? price,
//     String? image,
//   }) {
//     return CartTrxProduct(
//       idProduct: idProduct,
//       name: name,
//       productType: productType,
//       sku: sku,
//       category: category,
//       price: price ?? this.price,
//       qty: qty ?? this.qty,
//       stock: stock ?? this.stock,
//       image: image ?? this.image,
//     );
//   }
// }


