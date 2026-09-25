// import 'package:pos/core/extensions/session_manager.dart';
// import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

// class PrinterService {
//   final SessionManager _sessionManager;
//   PrinterService(this._sessionManager);

//   Future<List<BluetoothInfo>> getPaired() async {
//     return await PrintBluetoothThermal.pairedBluetooths;
//   }

//   Future<bool> connect(String mac, {String? name}) async {
//     final ok = await PrintBluetoothThermal.connect(macPrinterAddress: mac);
//     if (ok) {
//       await _sessionManager.saveLastPrinter(mac: mac, name: name);
//     }
//     return ok;
//   }

//   Future<void> disconnect() async {
//     await PrintBluetoothThermal.disconnect;
//   }

//   Future<bool> isConnected() async {
//     return await PrintBluetoothThermal.connectionStatus;
//   }

//   Future<String?> loadSavedMac() => _sessionManager.loadLastPrinterMac();
//   Future<String?> loadSavedName() => _sessionManager.loadLastPrinterName();

//   /// Restore koneksi:
//   /// 1) Ambil MAC tersimpan
//   /// 2) Jika device masih connect (connectionStatus == true) → return true
//   /// 3) Jika belum, coba connect ulang
//   Future<bool> restoreOrReconnect() async {
//     final saved = await _sessionManager.loadLastPrinterMac();
//     if (saved == null) return false;

//     final already = await isConnected();
//     if (already) return true;

//     return await connect(saved);
//   }
// }
