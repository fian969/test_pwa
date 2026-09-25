# Dokumentasi Fitur - Documentation App

## 📋 Ringkasan
Aplikasi Dokumentasi Fitur (Documentation App) adalah modul yang menampilkan dokumentasi lengkap untuk semua fitur yang tersedia dalam project Flutter dengan Clean Architecture. UI menggunakan efek glassmorphism yang modern dan menarik.

## 🎯 Fitur Utama

### 1. **Home Tab** - Jelajahi Fitur
- Grid tampilan fitur dengan glassmorphism design
- Search bar untuk mencari fitur
- Filter kategori (Semua, Widgets, Utils, Extensions)
- Featured section untuk fitur unggulan
- Navigasi ke detail fitur

### 2. **Chat Tab** - Chat Bantuan
- Interface chat interaktif dengan glassmorphism
- Pesan dari user dan assistant
- Input form untuk mengirim pertanyaan
- Timestamp untuk setiap pesan

### 3. **History Tab** - Riwayat Akses
- List riwayat akses fitur
- Informasi aksi yang dilakukan (Dibuka, Dibaca, Dicoba)
- Format waktu relatif (5m yang lalu, Kemarin, dll)
- Category badge untuk setiap fitur

### 4. **Profile Tab** - Profil Pengguna
- Informasi profil pengguna
- Statistik (Total Fitur, Dibaca, Diselesaikan)
- Pengaturan (Notifikasi, Mode Gelap, Bahasa)
- Informasi tentang aplikasi

## 🏗️ Struktur Clean Architecture

```
lib/features/documentation/
├── data/
│   ├── datasources/
│   │   └── local_documentation_datasource.dart    # Local data source
│   ├── models/
│   │   └── feature_model.dart                     # Feature model
│   └── repositories/
│       └── documentation_repository.dart           # Repository implementation
├── domain/
│   ├── entities/
│   │   ├── feature_entity.dart                    # Feature entity
│   │   ├── category_entity.dart                   # Category entity
│   │   └── documentation_history_entity.dart      # History entity
│   └── usecases/
│       └── feature_usecase.dart                   # Use cases
└── presentation/
    ├── pages/
    │   ├── documentation_page.dart                # Main page dengan bottom nav
    │   ├── documentation_home_page.dart           # Home tab
    │   ├── documentation_chat_page.dart           # Chat tab
    │   ├── documentation_history_page.dart        # History tab
    │   ├── documentation_profile_page.dart        # Profile tab
    │   └── documentation_detail_page.dart         # Detail fitur page
    └── widgets/
        ├── glass_container.dart                   # Glassmorphism widget
        ├── feature_card.dart                      # Feature card widget
        ├── category_tab.dart                      # Category tab widget
        └── search_bar.dart                        # Search bar widget
```

## 🎨 UI Components

### GlassContainer
Widget reusable untuk efek glassmorphism dengan customizable:
- Border radius
- Blur strength
- Glass color
- Box shadow
- Border

```dart
GlassContainer(
  borderRadius: 20,
  blurStrength: 15,
  glassColor: const Color(0xFFFFFFFF),
  padding: EdgeInsets.all(16),
  child: YourWidget(),
)
```

### FeatureCard
Card untuk menampilkan fitur dengan layout:
- Nama fitur + kategori badge
- Deskripsi singkat
- Tag (max 2)
- Arrow indicator

### CategoryTab
Tab untuk filter kategori dengan state active/inactive dengan glassmorphism style

### SearchBar Widget
Custom search bar dengan ikon search dan button clear

## 📊 Data & Features

Saat ini dokumentasi menyediakan 10 fitur:
1. **Print Service** - Layanan cetak ke printer thermal
2. **Calendar Picker** - Widget pemilih tanggal
3. **Alert Dialog** - Dialog alert yang dikustomisasi
4. **Snackbar Helper** - Helper untuk notifikasi
5. **App Button** - Button yang dapat dikustomisasi
6. **App Form Field** - Input field dengan validasi
7. **Logger Service** - Service untuk logging
8. **Session Manager** - Manager session dan preferensi
9. **Rupiah Formatter** - Extension format mata uang
10. **Date Time Extension** - Extension untuk operasi tanggal

## 🔄 Navigasi

### Routes
- `DocumentationRoute` - Main documentation page dengan bottom navigation
- `DocumentationDetailRoute` - Halaman detail fitur (menerima parameter `feature`)

### Integrasi ke Dashboard
Untuk menambahkan akses ke dokumentasi dari dashboard:

```dart
// Di dashboard atau menu
onTap: () {
  context.router.push(const DocumentationRoute());
}
```

## 🚀 Pengembangan Selanjutnya - Cubit Integration

Struktur sudah siap untuk integrasi Cubit. Rencana implementasi:

### 1. **Documentation Cubit**
```dart
// lib/features/documentation/presentation/cubit/documentation_cubit.dart
class DocumentationCubit extends Cubit<DocumentationState> {
  final GetAllFeaturesUseCase getAllFeaturesUseCase;
  
  DocumentationCubit(this.getAllFeaturesUseCase) : super(DocumentationInitial());
  
  Future<void> loadFeatures() async {
    // Implementation
  }
  
  void searchFeatures(String query) {
    // Implementation
  }
  
  void filterByCategory(String category) {
    // Implementation
  }
}
```

### 2. **States**
- `DocumentationInitial` - Initial state
- `DocumentationLoading` - Loading state
- `DocumentationLoaded` - Data loaded successfully
- `DocumentationError` - Error state

### 3. **Events** (jika menggunakan BLoC)
- `LoadFeaturesEvent`
- `SearchFeaturesEvent`
- `FilterCategoryEvent`

### 4. **Dependency Injection Setup** (injection.dart)
```dart
// Datasource
getIt.registerSingleton<LocalDocumentationDatasource>(
  LocalDocumentationDatasourceImpl(),
);

// Repository
getIt.registerSingleton<DocumentationRepository>(
  DocumentationRepositoryImpl(getIt()),
);

// Use Cases
getIt.registerSingleton<GetAllFeaturesUseCase>(
  GetAllFeaturesUseCase(getIt()),
);

// Cubit
getIt.registerSingleton<DocumentationCubit>(
  DocumentationCubit(getIt()),
);
```

## 🎨 Tema & Warna

Menggunakan AppColors dari core yang sudah ada:
- **Primary**: `Color.fromARGB(255, 46, 37, 128)` - Ungu
- **Secondary**: `Color(0xFFF5BE41)` - Gold/Kuning
- **Tertiary**: `Color(0xFF31A9B8)` - Teal
- **Background**: `Color(0xFFF2F2F2)` - Abu-abu terang

Glass gradient tersedia di: `AppColors.glassBlueGradient`

## 📱 Responsive Design

Menggunakan `flutter_screenutil` untuk responsive design:
- Design size: 375x812 (standar mobile)
- Min text adapt: enabled
- Split screen mode: enabled

## ✨ Fitur Glassmorphism

Efek glassmorphism dicapai melalui:
1. **BackdropFilter** - Blur background dengan `ImageFilter.blur`
2. **Box Decoration** - Semi-transparent background dengan border
3. **Border** - Semi-transparent white border
4. **BoxShadow** - Subtle shadow untuk depth

## 🔧 Cara Menggunakan

### Akses dari Dashboard
```dart
// Tambahkan tombol di dashboard
ElevatedButton(
  onPressed: () => context.router.push(const DocumentationRoute()),
  child: const Text('Dokumentasi'),
)
```

### Testing
Setiap page sudah memiliki mock data, jadi bisa langsung dijalankan tanpa backend.

## 📝 Catatan

- UI sudah lengkap dan siap diintegrasikan dengan Cubit
- Data saat ini menggunakan local data source (mock data)
- Setiap fitur memiliki contoh penggunaan (example) yang bisa dipandu dari UI
- Chat page saat ini adalah UI mock, implementasi sebenarnya bisa ditambahkan nanti
- History dan Profile page sudah memiliki struktur, data bisa disimpan menggunakan session manager

## 🔄 Next Steps

1. Implementasi Cubit untuk state management
2. Tambahkan real backend integration jika diperlukan
3. Implementasi fitur chat yang sebenarnya
4. Tambahkan fitur save/bookmark untuk fitur favorit
5. Implementasi dark mode support
6. Tambahkan analytics tracking untuk usage history
