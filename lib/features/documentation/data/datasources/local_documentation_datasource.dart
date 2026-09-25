import 'package:flutter_setup_clean_architectute/features/documentation/data/models/feature_model.dart';

abstract class LocalDocumentationDatasource {
  Future<List<FeatureModel>> getAllFeatures();
  Future<FeatureModel?> getFeatureById(String id);
  Future<List<FeatureModel>> getFeaturesByCategory(String category);
  Future<void> cacheFeatures(List<FeatureModel> features);
}

class LocalDocumentationDatasourceImpl implements LocalDocumentationDatasource {
  final List<FeatureModel> _cachedFeatures = _initializeFeatures();

  @override
  Future<List<FeatureModel>> getAllFeatures() async {
    return _cachedFeatures;
  }

  @override
  Future<FeatureModel?> getFeatureById(String id) async {
    try {
      return _cachedFeatures.firstWhere((feature) => feature.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<FeatureModel>> getFeaturesByCategory(String category) async {
    return _cachedFeatures
        .where((feature) => feature.category == category)
        .toList();
  }

  @override
  Future<void> cacheFeatures(List<FeatureModel> features) async {
    _cachedFeatures.clear();
    _cachedFeatures.addAll(features);
  }

  static List<FeatureModel> _initializeFeatures() {
    return [
      FeatureModel(
        id: '1',
        name: 'Print Service',
        description: 'Layanan cetak dokumentasi ke printer thermal Bluetooth',
        category: 'Utils',
        usage: 'Untuk mencetak struk, laporan, dan dokumen lainnya',
        tags: ['print', 'bluetooth', 'thermal', 'printer'],
        example:
            '''final printerService = PrinterService(sessionManager);
await printerService.connect('MAC_ADDRESS');
await printerService.printReceipt(receiptData);''',
        imageUrl: null,
        createdAt: DateTime.now(),
      ),
      FeatureModel(
        id: '2',
        name: 'Calendar Picker',
        description: 'Widget pemilih tanggal dengan tampilan kalender modern',
        category: 'Widgets',
        usage: 'Untuk memilih tanggal dalam form atau filter',
        tags: ['calendar', 'date', 'picker', 'widget'],
        example:
            '''AppCalendarPicker(
  title: 'Pilih Tanggal',
  initialDate: DateTime.now(),
  onDateSelected: (date) {
    print(date);
  },
)''',
        imageUrl: null,
        createdAt: DateTime.now(),
      ),
      FeatureModel(
        id: '3',
        name: 'Alert Dialog',
        description: 'Dialog alert yang dapat dikustomisasi dengan icon dan action',
        category: 'Widgets',
        usage: 'Untuk menampilkan peringatan, konfirmasi, atau informasi',
        tags: ['dialog', 'alert', 'confirmation', 'ui'],
        example:
            '''showDialog(
  context: context,
  builder: (context) => AppDialog(
    model: DialogUIMode(
      title: 'Konfirmasi',
      description: 'Apakah anda yakin?',
      onPositive: () {},
    ),
  ),
)''',
        imageUrl: null,
        createdAt: DateTime.now(),
      ),
      FeatureModel(
        id: '4',
        name: 'Snackbar Helper',
        description: 'Helper untuk menampilkan snackbar dengan berbagai tipe',
        category: 'Utils',
        usage: 'Untuk menampilkan notifikasi singkat kepada user',
        tags: ['snackbar', 'notification', 'helper', 'ui'],
        example:
            '''SnackBarHelper.showSnackBarSuccess(
  context,
  'Berhasil menyimpan data',
);''',
        imageUrl: null,
        createdAt: DateTime.now(),
      ),
      FeatureModel(
        id: '5',
        name: 'App Button',
        description: 'Button yang dapat dikustomisasi dengan berbagai style',
        category: 'Widgets',
        usage: 'Untuk aksi primary, secondary, atau dengan icon',
        tags: ['button', 'widget', 'material', 'ui'],
        example:
            '''AppButton(
  title: 'Simpan',
  onPressed: () {},
  height: 48,
  radius: 100,
)''',
        imageUrl: null,
        createdAt: DateTime.now(),
      ),
      FeatureModel(
        id: '6',
        name: 'App Form Field',
        description: 'Input field yang sudah dikustomisasi dengan validasi',
        category: 'Widgets',
        usage: 'Untuk input data dengan validasi built-in',
        tags: ['form', 'input', 'field', 'validation'],
        example:
            '''AppField(
  controller: textController,
  label: 'Email',
  hintText: 'Masukkan email',
  validator: (value) => value?.isEmpty ?? true ? 'Email required' : null,
)''',
        imageUrl: null,
        createdAt: DateTime.now(),
      ),
      FeatureModel(
        id: '7',
        name: 'Logger Service',
        description: 'Service untuk logging dan debugging dengan berbagai level',
        category: 'Utils',
        usage: 'Untuk mencatat log aplikasi dan debugging',
        tags: ['logger', 'debug', 'logging', 'service'],
        example:
            '''logger.d('Debug message');
logger.i('Info message');
logger.w('Warning message');
logger.e('Error message');''',
        imageUrl: null,
        createdAt: DateTime.now(),
      ),
      FeatureModel(
        id: '8',
        name: 'Session Manager',
        description: 'Manager untuk mengelola session dan preferensi user',
        category: 'Utils',
        usage: 'Untuk menyimpan dan mengambil data session',
        tags: ['session', 'preferences', 'storage', 'manager'],
        example:
            '''final sessionManager = SessionManager();
await sessionManager.setLoginStatus(true);
final isLoggedIn = await sessionManager.getLoginStatus();''',
        imageUrl: null,
        createdAt: DateTime.now(),
      ),
      FeatureModel(
        id: '9',
        name: 'Rupiah Formatter',
        description: 'Extension untuk format angka menjadi format rupiah',
        category: 'Extensions',
        usage: 'Untuk menampilkan angka dengan format mata uang rupiah',
        tags: ['formatter', 'currency', 'extension', 'rupiah'],
        example:
            '''int amount = 50000;
String formatted = amount.toRupiahFormat(); // Rp50.000''',
        imageUrl: null,
        createdAt: DateTime.now(),
      ),
      FeatureModel(
        id: '10',
        name: 'Date Time Extension',
        description: 'Extension untuk operasi tanggal dan waktu',
        category: 'Extensions',
        usage: 'Untuk format dan manipulasi tanggal',
        tags: ['datetime', 'extension', 'format', 'date'],
        example:
            '''DateTime now = DateTime.now();
String formatted = now.toFormattedString(); // 27-08-2026
String time = now.timeString(); // 14:30''',
        imageUrl: null,
        createdAt: DateTime.now(),
      ),
    ];
  }
}
