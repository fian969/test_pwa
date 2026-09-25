# Quick Start Guide - Documentation Feature

Panduan cepat untuk mengakses dan menggunakan Documentation Feature di aplikasi Anda.

## 🚀 Akses Cepat

### Dari Dashboard
Tambahkan tombol atau menu item di dashboard untuk navigasi ke dokumentasi:

```dart
// Di dashboard_page.dart atau dashboard widget apapun
import 'package:auto_route/auto_route.dart';

// Contoh 1: Tombol di floating button
FloatingActionButton(
  onPressed: () {
    context.router.push(const DocumentationRoute());
  },
  child: const Icon(Icons.help_outline),
)

// Contoh 2: Menu item
ListTile(
  leading: const Icon(Icons.book),
  title: const Text('Dokumentasi Fitur'),
  onTap: () {
    context.router.push(const DocumentationRoute());
  },
)

// Contoh 3: Custom button
GestureDetector(
  onTap: () {
    context.router.push(const DocumentationRoute());
  },
  child: Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      gradient: AppColors.primaryGradient,
      borderRadius: BorderRadius.circular(12),
    ),
    child: const Text(
      'Buka Dokumentasi',
      style: TextStyle(color: Colors.white),
    ),
  ),
)
```

## 📱 Interface Overview

### Tab 1: Home
- **Search Bar**: Cari fitur dengan keyword
- **Featured Section**: Fitur unggulan
- **Category Filter**: Filter by Widgets, Utils, Extensions
- **Grid**: Semua fitur dalam layout 2 kolom
- **Navigation**: Tap fitur untuk melihat detail

### Tab 2: Chat
- **Pertanyaan**: Tanyakan tentang penggunaan fitur
- **Response**: Bot akan membalas
- **History**: Lihat chat history
- **Input**: Text field untuk pertanyaan baru

### Tab 3: History
- **Access Log**: Riwayat akses fitur
- **Time Format**: Waktu relatif (5m lalu, Kemarin, etc)
- **Action Info**: Apa yang dilakukan (Dibuka, Dibaca, Dicoba)
- **Category**: Badge kategori fitur

### Tab 4: Profile
- **User Info**: Profil pengguna
- **Statistics**: Total fitur, sudah dibaca, diselesaikan
- **Settings**: Notifikasi, Dark Mode, Bahasa
- **About**: Informasi aplikasi dan versi

## 🎯 Fitur Utama

### 1. Search & Filter
```dart
// Fitur search:
- Real-time search saat mengetik
- Filter by kategori bersamaan
- Highlight hasil yang cocok

// Kategori available:
- Semua (default)
- Widgets
- Utils
- Extensions
```

### 2. Feature Detail
```dart
// Informasi lengkap per fitur:
- Deskripsi detail
- Cara penggunaan
- Contoh kode (copy-able)
- Tags/keywords
- Kategori
```

### 3. Glassmorphism Design
```dart
// UI Elements menggunakan glass effect:
- Cards dengan blur background
- Buttons dengan semi-transparent design
- Smooth transitions
- Modern aesthetic
```

## 📊 Data Struktur

### Feature Info
Setiap fitur memiliki:
```dart
- id: String
- name: String (nama fitur)
- description: String (deskripsi singkat)
- category: String (Widgets/Utils/Extensions)
- usage: String (cara penggunaan)
- tags: List<String> (keywords)
- example: String (code example)
- imageUrl: String? (optional gambar)
- createdAt: DateTime? (optional tanggal)
```

## 🔧 Customization

### Menambah Fitur Baru
Edit `local_documentation_datasource.dart`:

```dart
static List<FeatureModel> _initializeFeatures() {
  return [
    // ... existing features
    
    FeatureModel(
      id: '11',
      name: 'Nama Fitur Baru',
      description: 'Deskripsi fitur',
      category: 'Widgets',
      usage: 'Cara penggunaannya',
      tags: ['tag1', 'tag2'],
      example: '''
// Contoh kode
```dart
CodeExample here
```
      ''',
      createdAt: DateTime.now(),
    ),
  ];
}
```

### Mengubah Warna/Tema
Update di `lib/core/color/app_colors.dart`:

```dart
// Glass container color
glassColor: const Color(0xFFFFFFFF), // Ubah dari sini

// Primary accent color
primary: const Color.fromARGB(255, 46, 37, 128), // Ubah dari sini

// Gradient
glassBlueGradient: const LinearGradient(...)
```

### Mengubah Layout
Update di masing-masing page:

```dart
// Grid columns
SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 2,  // Ubah jumlah kolom
  childAspectRatio: 0.75,  // Ubah aspect ratio
)

// Padding dan spacing
padding: EdgeInsets.all(16.w),  // Ubah padding
SizedBox(height: 12.h),  // Ubah spacing
```

## 📝 Current Features (Built-in)

### 1. Print Service
- Cetak ke printer thermal Bluetooth
- Salin MAC address dan koneksi

### 2. Calendar Picker
- Pilih tanggal dengan widget calendar
- Format tanggal yang fleksibel

### 3. Alert Dialog
- Dialog dengan icon dan action buttons
- Customize warna berdasarkan type

### 4. Snackbar Helper
- Notifikasi singkat dengan berbagai style
- Success, error, warning, info

### 5. App Button
- Button dengan berbagai style
- Support icon, gradient, custom color

### 6. App Form Field
- Input field dengan validasi built-in
- Mask input, autocomplete, etc

### 7. Logger Service
- Logging dengan berbagai level
- Debug, Info, Warning, Error

### 8. Session Manager
- Simpan/load session user
- Preferensi dan settings

### 9. Rupiah Formatter
- Format angka ke mata uang Rupiah
- Thousands separator otomatis

### 10. DateTime Extension
- Format tanggal dan waktu
- Relative time (5 menit lalu, etc)

## ⚙️ Configuration

### Routes
Sudah di-setup di `app_router.dart`:
```dart
AutoRoute(page: DocumentationRoute.page),
AutoRoute(page: DocumentationDetailRoute.page),
```

### Dependencies
Semua dependencies sudah ada di `pubspec.yaml`:
- flutter_bloc
- flutter_screenutil
- auto_route
- intl

### No Setup Required
- Fitur sudah ready to use
- Mock data sudah tersedia
- Tidak perlu backend connection
- Langsung bisa diakses

## 🧪 Testing

### Manual Testing Checklist
- [ ] Buka dokumentasi dari dashboard
- [ ] Search fitur dengan keyword
- [ ] Filter kategori
- [ ] Tap fitur untuk lihat detail
- [ ] Copy code dari example
- [ ] Cek semua 4 tabs
- [ ] Scroll pada halaman yang panjang
- [ ] Test responsive di berbagai ukuran

### Device Testing
- [ ] Test di phone portrait
- [ ] Test di tablet landscape
- [ ] Test dengan dynamic text size
- [ ] Test dark mode (future feature)

## 🚨 Troubleshooting

### Issue: Route tidak ketemu
**Solution**: Jalankan `flutter pub run build_runner build`

### Issue: Assets tidak ketemu
**Solution**: Jalankan `flutter pub run build_runner build` dan `flutter pub run flutter_gen`

### Issue: Build errors
**Solution**: 
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter pub run flutter_gen
```

### Issue: UI terlalu kecil/besar
**Solution**: Sesuaikan design size di `app.dart`:
```dart
ScreenUtilInit(
  designSize: const Size(375, 812),  // Ubah dari sini
)
```

## 🎓 Learning Resources

Struktur ini menggunakan Clean Architecture dengan:
- **Entity**: Business model (feature_entity.dart)
- **Model**: Data model (feature_model.dart)
- **Repository**: Data abstraction (documentation_repository.dart)
- **Use Case**: Business logic (feature_usecase.dart)
- **Presentation**: UI layer (pages & widgets)

Untuk memahami lebih lanjut, lihat:
- `FILE_STRUCTURE.md` - Penjelasan detail setiap file
- `README.md` - Feature overview
- `CUBIT_IMPLEMENTATION.md` - Guide integrasi Cubit

## 📞 Support

Untuk pertanyaan atau issue:
1. Cek documentasi di file README.md
2. Lihat code comments di setiap file
3. Cek example usage di detail page
4. Lihat CUBIT_IMPLEMENTATION.md untuk next steps

---

**Last Updated**: 27 Agustus 2026
**Version**: 1.0.0 (UI Only)
**Status**: Ready for Cubit Integration
