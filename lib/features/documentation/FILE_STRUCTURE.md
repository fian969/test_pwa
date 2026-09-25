# File Structure Overview - Documentation Feature

## 📁 Complete File Tree

```
lib/features/documentation/
│
├── README.md
│
├── domain/
│   ├── entities/
│   │   ├── feature_entity.dart
│   │   ├── category_entity.dart
│   │   └── documentation_history_entity.dart
│   └── usecases/
│       └── feature_usecase.dart
│
├── data/
│   ├── datasources/
│   │   └── local_documentation_datasource.dart
│   ├── models/
│   │   └── feature_model.dart
│   └── repositories/
│       └── documentation_repository.dart
│
└── presentation/
    ├── pages/
    │   ├── documentation_page.dart              (Main page with bottom nav)
    │   ├── documentation_home_page.dart         (Home tab)
    │   ├── documentation_chat_page.dart         (Chat tab)
    │   ├── documentation_history_page.dart      (History tab)
    │   ├── documentation_profile_page.dart      (Profile tab)
    │   └── documentation_detail_page.dart       (Feature detail)
    └── widgets/
        ├── glass_container.dart                 (Glassmorphism widget)
        ├── feature_card.dart                    (Feature card)
        ├── category_tab.dart                    (Category filter)
        └── search_bar.dart                      (Custom search bar)
```

## 📄 File Details

### Domain Layer

#### `entities/feature_entity.dart`
Mendefinisikan model Feature untuk business logic:
- `id`: Unique identifier
- `name`: Nama fitur
- `description`: Deskripsi fitur
- `category`: Kategori (Widgets, Utils, Extensions)
- `usage`: Cara penggunaan
- `tags`: Tags/keywords
- `example`: Code example
- `imageUrl`: URL gambar (optional)
- `createdAt`: Tanggal pembuatan (optional)

#### `entities/category_entity.dart`
Mendefinisikan kategori fitur:
- `id`: Unique identifier
- `name`: Nama kategori
- `icon`: Icon untuk kategori
- `description`: Deskripsi kategori
- `featureCount`: Jumlah fitur

#### `entities/documentation_history_entity.dart`
Mendefinisikan riwayat akses:
- `id`: Unique identifier
- `featureName`: Nama fitur yang diakses
- `action`: Aksi yang dilakukan
- `timestamp`: Waktu akses
- `notes`: Catatan tambahan (optional)

#### `usecases/feature_usecase.dart`
Use cases untuk business logic:
- `GetAllFeaturesUseCase`: Mengambil semua fitur
- `GetFeatureByCategoryUseCase`: Filter fitur by kategori

### Data Layer

#### `datasources/local_documentation_datasource.dart`
Local data source untuk dokumentasi:
- `getAllFeatures()`: Get semua fitur
- `getFeatureById(id)`: Get fitur by ID
- `getFeaturesByCategory(category)`: Get fitur by kategori
- `cacheFeatures(features)`: Cache fitur

**Mock Data**: Sudah menyediakan 10 fitur contoh yang bisa digunakan langsung

#### `models/feature_model.dart`
Extension dari FeatureEntity dengan JSON serialization:
- `fromJson()`: Parse dari JSON
- `toJson()`: Convert ke JSON

#### `repositories/documentation_repository.dart`
Interface dan implementasi repository:
- Menghubungkan domain dengan data layer
- Implementasi: `DocumentationRepositoryImpl`

### Presentation Layer

#### `pages/documentation_page.dart`
Main page dengan bottom navigation:
- 4 tabs: Home, Chat, History, Profile
- Custom bottom navigation bar dengan glassmorphism
- Selected indicator dengan primary color

#### `pages/documentation_home_page.dart`
Home tab - Jelajahi fitur:
- Search bar dengan icon dan clear button
- Featured section untuk fitur unggulan
- Category filter dengan glassmorphism tabs
- Grid layout untuk semua fitur
- Integration dengan `DocumentationDetailRoute`

**Widgets**: 
- `SearchBar`: Custom search widget
- `CategoryTab`: Filter category widget
- `FeatureCard`: Card untuk feature

**Features**:
- Real-time search dan filter
- Grid responsive dengan 2 kolom

#### `pages/documentation_chat_page.dart`
Chat tab - Chat bantuan:
- Message list dengan glassmorphism bubbles
- Input form dengan send button
- Timestamp untuk setiap pesan
- Simulasi bot response

**UI Elements**:
- User message: Primary color (right aligned)
- Bot message: White background (left aligned)
- Elegant send button dengan glass effect

#### `pages/documentation_history_page.dart`
History tab - Riwayat akses:
- List riwayat dengan item card
- Avatar dengan initial huruf
- Information: feature name, action, time
- Category badge
- Format waktu relatif (5m yang lalu, Kemarin, dll)

#### `pages/documentation_profile_page.dart`
Profile tab - Profil pengguna:
- Profile header dengan avatar dan info
- Statistics cards (Total Fitur, Dibaca, Diselesaikan)
- Settings section (Notifikasi, Dark Mode, Bahasa)
- About section dengan info aplikasi

**Custom Widgets**:
- `_StatCard`: Card untuk statistik
- `_SettingItem`: Item untuk setting

#### `pages/documentation_detail_page.dart`
Feature detail page:
- Back button untuk kembali
- Feature name + category badge
- Description section
- Usage section
- Tags dengan glassmorphism style
- Code example dengan monospace font
- Copy button untuk copy kode
- Selectable text untuk kode

**Sections**:
- Deskripsi fitur
- Cara penggunaan
- Tags/keywords
- Contoh kode
- Copy to clipboard button

### Presentation Widgets

#### `widgets/glass_container.dart`
Reusable glassmorphism container:
- `BackdropFilter` dengan blur effect
- Semi-transparent background
- Border dengan semi-transparent white
- Customizable padding, border radius, blur strength
- Box shadow untuk depth
- Optional onTap callback

**Parameters**:
- `child`: Widget content
- `width/height`: Ukuran (optional)
- `borderRadius`: Border radius (default: 20)
- `blurStrength`: Blur effect strength (default: 10)
- `glassColor`: Background color (default: white)
- `padding`: Padding content (default: all 16)
- `border`: Custom border (optional)
- `onTap`: Callback ketika di-tap (optional)
- `boxShadow`: Custom shadow (optional)

#### `widgets/feature_card.dart`
Card untuk menampilkan feature:
- Header: Nama + kategori badge
- Description dengan max 2 lines
- Tags (max 2 tags)
- Arrow indicator di bottom right
- OnTap callback
- Glassmorphism style

**Layout**:
- Vertical spacing dengan SizedBox
- Flex layout untuk maximize space

#### `widgets/category_tab.dart`
Tab untuk filter kategori:
- Active state: Glassmorphism dengan primary color
- Inactive state: Border style
- Smooth transition dengan GestureDetector
- OnTap callback untuk filter

#### `widgets/search_bar.dart`
Custom search bar:
- Icon search di kiri
- TextField dengan hint text
- Icon clear (muncul saat ada text)
- Glassmorphism style
- TextEditingController untuk manage input
- OnChanged callback

## 🔄 Data Flow

```
Local Data Source (Mock Data)
        ↓
Repository
        ↓
Use Cases
        ↓
Presentation Layer (Pages & Widgets)
        ↓
UI Components (GlassContainer, Cards, Tabs)
```

## 🎯 Current State
- ✅ Complete UI implementation
- ✅ Mock data ready
- ✅ Navigation integrated
- ✅ Glassmorphism effects
- ✅ Responsive design
- ⏳ Cubit integration (ready for implementation)
- ⏳ Backend integration (if needed)

## 🚀 Quick Start

1. **Akses dokumentasi dari dashboard**:
```dart
context.router.push(const DocumentationRoute());
```

2. **Tampilan otomatis dengan mock data**:
   - Tidak perlu setup tambahan
   - 10 fitur sudah tersedia
   - Bisa langsung test

3. **Navigasi antar tab**:
   - Gunakan bottom navigation bar
   - Atau programatically ubah `_selectedIndex`

## 💡 Tips Pengembangan

1. **Menambah fitur baru**: Edit `_initializeFeatures()` di `local_documentation_datasource.dart`
2. **Mengubah warna**: Update di `lib/core/color/app_colors.dart`
3. **Responsive**: Gunakan `flutter_screenutil` untuk sizing
4. **Glass effect**: Gunakan `GlassContainer` widget
5. **Import**: Perhatikan import path, terutama untuk widgets custom

## 📚 Related Files

- **Routing**: `lib/core/navigation/app_router.dart`
- **Colors**: `lib/core/color/app_colors.dart`
- **Extensions**: `lib/core/extensions/`
- **Widgets Core**: `lib/core/widget/`
- **Generated Routes**: `lib/core/navigation/app_router.gr.dart` (auto-generated)
