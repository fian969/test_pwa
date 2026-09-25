import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/presentation/widgets/status_card.dart';

class BluetoothStatusCard extends StatefulWidget {
  const BluetoothStatusCard({super.key});

  @override
  State<BluetoothStatusCard> createState() => _BluetoothStatusCardState();
}

class _BluetoothStatusCardState extends State<BluetoothStatusCard> {
  bool _isBluetoothEnabled = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _checkBluetoothStatus();
  }

  Future<void> _checkBluetoothStatus() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _isBluetoothEnabled = true;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StatusCard(
      title: 'Status Bluetooth',
      subtitle: _isBluetoothEnabled ? 'Bluetooth Aktif' : 'Bluetooth Tidak Aktif',
      icon: Icons.bluetooth,
      backgroundColor: _isBluetoothEnabled ? const Color(0xFF4CAF50) : const Color(0xFFF44336),
      iconBgColor: _isBluetoothEnabled ? const Color(0xFF4CAF50) : const Color(0xFFF44336),
      onRefresh: _isLoading ? null : _checkBluetoothStatus,
      isLoading: _isLoading,
      statusWidget: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: _isBluetoothEnabled ? const Color(0xFF4CAF50).withAlpha(100) : const Color(0xFFF44336).withAlpha(100),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            Icon(_isBluetoothEnabled ? Icons.check_circle : Icons.warning, 
              color: _isBluetoothEnabled ? const Color(0xFF4CAF50) : const Color(0xFFF44336), size: 16.sp),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                _isBluetoothEnabled ? 'Bluetooth sudah aktif dan siap digunakan' : 'Silakan nyalakan Bluetooth untuk melanjutkan',
                style: TextStyle(fontSize: 11.sp, color: _isBluetoothEnabled ? const Color(0xFF4CAF50) : const Color(0xFFF44336), fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

