import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'session_manager.dart';

class Printers {
  final SessionManager _session;

  Printers(this._session);

  /// ambil daftar printer yang sudah paired
  Future<List<BluetoothInfo>> scan() async {
    final devices = await PrintBluetoothThermal.pairedBluetooths;

    // filter hanya device yang kemungkinan printer thermal
    final printers = devices.where((d) {
      final name = d.name.toLowerCase();
      return name.contains("printer") ||
          name.contains("pos") ||
          name.contains("rpp"); // contoh RPP02N
    }).toList();

    return printers;
  }

  Future<bool> checkBluetooth() async {
    // minta izin
    await Permission.bluetoothConnect.request();
    await Permission.bluetoothScan.request();

    // di Android 11 ke bawah beberapa device masih butuh lokasi
    if (await Permission.location.isDenied) {
      await Permission.location.request();
    }

    // cek status bluetooth
    return await PrintBluetoothThermal.bluetoothEnabled;
  }

  /// connect ke printer dan simpan ke session
  Future<bool> connect(String mac, {String? name}) async {
    final ok = await PrintBluetoothThermal.connect(macPrinterAddress: mac);
    if (ok) {
      await _session.saveLastPrinter(mac: mac, name: name);
    }
    return ok;
  }

  /// disconnect printer
  Future<void> disconnect() async {
    await PrintBluetoothThermal.disconnect;
  }

  /// cek apakah masih connected
  Future<bool> isConnected() async {
    return await PrintBluetoothThermal.connectionStatus;
  }

  /// ambil MAC printer tersimpan
  Future<String?> getSavedMac() => _session.loadLastPrinterMac();

  /// ambil Nama printer tersimpan
  Future<String?> getSavedName() => _session.loadLastPrinterName();

  /// hapus printer tersimpan
  Future<void> clearSavedPrinter() => _session.clearLastPrinter();

  /// restore koneksi printer tersimpan
  Future<bool> restoreOrReconnect() async {
    final savedMac = await getSavedMac();
    if (savedMac == null) return false;

    final isConn = await isConnected();
    if (isConn) return true;

    return await connect(savedMac);
  }

  /// print cepat (text sederhana)
  Future<void> printQuick() async {
    final isConn = await isConnected();
    if (!isConn) throw Exception("Printer belum terhubung");

    await PrintBluetoothThermal.writeBytes('\n'.codeUnits);
    await PrintBluetoothThermal.writeString(
      printText: PrintTextSize(size: 2, text: "TES CETAK\n"),
    );
    await PrintBluetoothThermal.writeString(
      printText: PrintTextSize(size: 1, text: "Hello dari Flutter\n"),
    );
    await PrintBluetoothThermal.writeBytes('\n\n'.codeUnits);
  }

  /// print struk pakai ESC/POS
  Future<void> printReceipt() async {
    final isConn = await isConnected();
    if (!isConn) throw Exception("Printer belum terhubung");

    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);

    List<int> bytes = [];
    bytes += generator.reset();
    bytes += generator.text(
      'TOKO TES PRINT',
      styles: const PosStyles(
        align: PosAlign.center,
        bold: true,
        height: PosTextSize.size2,
        width: PosTextSize.size2,
      ),
    );
    bytes += generator.text('Jl. Mawar 123, Purwokerto',
        styles: const PosStyles(align: PosAlign.center));
    bytes += generator.hr();
    bytes += generator.text('Kode: TRX-001');
    bytes += generator.text('Tanggal: 23-09-2025 09:30');
    bytes += generator.hr();
    bytes += generator.row([
      PosColumn(width: 8, text: 'Produk A'),
      PosColumn(width: 4, text: '2 x 10.000'),
    ]);
    bytes += generator.row([
      PosColumn(width: 8, text: 'TOTAL', styles: const PosStyles(bold: true)),
      PosColumn(
        width: 4,
        text: '20.000',
        styles: const PosStyles(align: PosAlign.right, bold: true),
      ),
    ]);
    bytes += generator.feed(2);

    await PrintBluetoothThermal.writeBytes(bytes);
  }

  Future<void> printTransaction({
    // required Transaction transaction,
    required String date,
    String? transactionCode,
    required String message,
  }) async {
    // logger.d("message tes transaction: $transaction");
    final isConn = await isConnected();
    if (!isConn) throw Exception("Printer belum terhubung");

    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);

    List<int> bytes = [];
    bytes += generator.reset();
    bytes += generator.text(
      'Toko POS Flutter',
      styles: const PosStyles(
        align: PosAlign.center,
        bold: true,
        height: PosTextSize.size1,
        width: PosTextSize.size1,
      ),
    );
    bytes += generator.text(
      'Jl. Pabuaran Raya No 32, Purwokerto Utara',
      styles: const PosStyles(align: PosAlign.center),
    );
    bytes += generator.hr();
    bytes += generator.text(transactionCode ?? "");
    bytes += generator.text(date);
    bytes += generator.feed(1);
    bytes += generator.text("Kasir: Admin}");
    bytes += generator.hr();
    // for (final p in transaction.items) {
    //   final subtotal = p.price * p.qty;
    //   bytes += generator.text(
    //     p.name.toString(),
    //     styles: const PosStyles(width: PosTextSize.size1),
    //   );
    //   bytes += generator.row([
    //     PosColumn(
    //       width: 8,
    //       text: '${p.qty} x ${p.price.toRupiah()}',
    //     ),
    //     PosColumn(
    //       width: 4,
    //       text: subtotal.toRupiah(),
    //       styles: const PosStyles(align: PosAlign.right),
    //     ),
    //   ]);
    //   bytes += generator.feed(1);
    // }
    bytes += generator.hr();
    bytes += generator.row([
      PosColumn(
        width: 8,
        text: 'TOTAL',
        styles: const PosStyles(bold: true),
      ),
      PosColumn(
        width: 4,
        text: 'Rp 100.000',
        styles: const PosStyles(align: PosAlign.right, bold: true),
      ),
    ]);
    bytes += generator.row([
      PosColumn(
        width: 8,
        text: 'Pembayaran',
      ),
      PosColumn(
        width: 4,
        text: 'Transfer',
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);

    bytes += generator.feed(2);
    bytes += generator.text(
      message,
      styles: const PosStyles(align: PosAlign.center),
    );

    bytes += generator.feed(3);

    await PrintBluetoothThermal.writeBytes(bytes);
  }
}
