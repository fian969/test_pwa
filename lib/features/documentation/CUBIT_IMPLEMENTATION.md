# Cubit Implementation Guide - Documentation Feature

Panduan lengkap untuk mengintegrasikan Cubit state management ke Documentation Feature.

## 📋 Overview

Dokumentasi feature sudah memiliki struktur clean architecture yang complete. Sekarang saatnya menambahkan Cubit untuk state management dan business logic.

## 🏗️ Struktur Folder untuk Cubit

Tambahkan folder `cubit` di presentation layer:

```
lib/features/documentation/presentation/
├── pages/
├── widgets/
└── cubit/                              # (NEW)
    ├── documentation_cubit.dart        # Main Cubit
    └── documentation_state.dart        # State definitions
```

## 📝 Step 1: Define States

File: `lib/features/documentation/presentation/cubit/documentation_state.dart`

```dart
part of 'documentation_cubit.dart';

abstract class DocumentationState extends Equatable {
  const DocumentationState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class DocumentationInitial extends DocumentationState {
  const DocumentationInitial();
}

/// Loading state
class DocumentationLoading extends DocumentationState {
  const DocumentationLoading();
}

/// Features loaded successfully
class DocumentationLoaded extends DocumentationState {
  final List<FeatureEntity> allFeatures;
  final List<FeatureEntity> displayedFeatures;
  final String selectedCategory;
  final String searchQuery;

  const DocumentationLoaded({
    required this.allFeatures,
    required this.displayedFeatures,
    required this.selectedCategory,
    required this.searchQuery,
  });

  @override
  List<Object?> get props => [
    allFeatures,
    displayedFeatures,
    selectedCategory,
    searchQuery,
  ];
}

/// Error state
class DocumentationError extends DocumentationState {
  final String message;

  const DocumentationError(this.message);

  @override
  List<Object?> get props => [message];
}

/// Feature detail loaded
class FeatureDetailLoaded extends DocumentationState {
  final FeatureEntity feature;

  const FeatureDetailLoaded(this.feature);

  @override
  List<Object?> get props => [feature];
}
```

## 🎯 Step 2: Create Cubit

File: `lib/features/documentation/presentation/cubit/documentation_cubit.dart`

```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/domain/entities/feature_entity.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/domain/usecases/feature_usecase.dart';

part 'documentation_state.dart';

class DocumentationCubit extends Cubit<DocumentationState> {
  final GetAllFeaturesUseCase getAllFeaturesUseCase;
  final GetFeatureByCategoryUseCase getFeatureByCategoryUseCase;

  DocumentationCubit({
    required this.getAllFeaturesUseCase,
    required this.getFeatureByCategoryUseCase,
  }) : super(const DocumentationInitial());

  /// Load semua fitur saat pertama kali
  Future<void> loadFeatures() async {
    try {
      emit(const DocumentationLoading());
      
      final features = await getAllFeaturesUseCase.call();
      
      emit(DocumentationLoaded(
        allFeatures: features,
        displayedFeatures: features,
        selectedCategory: 'Semua',
        searchQuery: '',
      ));
    } catch (e) {
      emit(DocumentationError('Gagal memuat fitur: ${e.toString()}'));
    }
  }

  /// Filter fitur berdasarkan kategori
  void filterByCategory(String category) async {
    final currentState = state;
    
    if (currentState is! DocumentationLoaded) return;

    try {
      List<FeatureEntity> filtered;

      if (category == 'Semua') {
        filtered = currentState.allFeatures;
      } else {
        filtered = await getFeatureByCategoryUseCase.call(category);
      }

      // Apply search query jika ada
      if (currentState.searchQuery.isNotEmpty) {
        filtered = filtered
            .where((feature) =>
                feature.name
                    .toLowerCase()
                    .contains(currentState.searchQuery.toLowerCase()) ||
                feature.description
                    .toLowerCase()
                    .contains(currentState.searchQuery.toLowerCase()))
            .toList();
      }

      emit(DocumentationLoaded(
        allFeatures: currentState.allFeatures,
        displayedFeatures: filtered,
        selectedCategory: category,
        searchQuery: currentState.searchQuery,
      ));
    } catch (e) {
      emit(DocumentationError('Error filter: ${e.toString()}'));
    }
  }

  /// Search fitur
  void searchFeatures(String query) {
    final currentState = state;

    if (currentState is! DocumentationLoaded) return;

    try {
      List<FeatureEntity> filtered = currentState.allFeatures
          .where((feature) =>
              feature.name.toLowerCase().contains(query.toLowerCase()) ||
              feature.description.toLowerCase().contains(query.toLowerCase()))
          .toList();

      // Apply category filter
      if (currentState.selectedCategory != 'Semua') {
        filtered = filtered
            .where((feature) =>
                feature.category == currentState.selectedCategory)
            .toList();
      }

      emit(DocumentationLoaded(
        allFeatures: currentState.allFeatures,
        displayedFeatures: filtered,
        selectedCategory: currentState.selectedCategory,
        searchQuery: query,
      ));
    } catch (e) {
      emit(DocumentationError('Error search: ${e.toString()}'));
    }
  }

  /// Load detail fitur
  void loadFeatureDetail(FeatureEntity feature) {
    emit(FeatureDetailLoaded(feature));
  }

  /// Reset ke list
  void resetToList() {
    final currentState = state;
    if (currentState is DocumentationLoaded) {
      emit(DocumentationLoaded(
        allFeatures: currentState.allFeatures,
        displayedFeatures: currentState.displayedFeatures,
        selectedCategory: currentState.selectedCategory,
        searchQuery: currentState.searchQuery,
      ));
    }
  }
}
```

## 🔧 Step 3: Setup Dependency Injection

Update `lib/core/di/injection.dart`:

```dart
// ... existing imports

@InjectableInit()
Future<void> configureDependencies() async {
  // ... existing registrations

  // Documentation Feature
  getIt.registerSingleton<LocalDocumentationDatasource>(
    LocalDocumentationDatasourceImpl(),
  );

  getIt.registerSingleton<DocumentationRepository>(
    DocumentationRepositoryImpl(getIt()),
  );

  getIt.registerSingleton<GetAllFeaturesUseCase>(
    GetAllFeaturesUseCase(getIt()),
  );

  getIt.registerSingleton<GetFeatureByCategoryUseCase>(
    GetFeatureByCategoryUseCase(getIt()),
  );

  getIt.registerSingleton<DocumentationCubit>(
    DocumentationCubit(
      getAllFeaturesUseCase: getIt(),
      getFeatureByCategoryUseCase: getIt(),
    ),
  );
}
```

## 📱 Step 4: Update Pages dengan Cubit

### Update `documentation_home_page.dart`

```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_setup_clean_architectute/core/di/injection.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/presentation/cubit/documentation_cubit.dart';

// Ganti class dari StatefulWidget ke StatelessWidget
class DocumentationHomePage extends StatelessWidget {
  const DocumentationHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DocumentationCubit, DocumentationState>(
      builder: (context, state) {
        if (state is DocumentationLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is DocumentationError) {
          return Center(child: Text('Error: ${state.message}'));
        }

        if (state is DocumentationLoaded) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: CustomScrollView(
              slivers: [
                // AppBar
                SliverAppBar(
                  floating: true,
                  pinned: true,
                  elevation: 0,
                  backgroundColor: AppColors.background,
                  title: Text(
                    'Dokumentasi Fitur',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                  centerTitle: false,
                ),

                SliverPadding(
                  padding: EdgeInsets.all(16.w),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      // Search Bar
                      doc_search.SearchBar(
                        onChanged: (query) {
                          context.read<DocumentationCubit>().searchFeatures(query);
                        },
                      ),
                      SizedBox(height: 16.h),

                      // Featured Section
                      if (state.displayedFeatures.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Fitur Unggulan',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            GlassContainer(
                              // ... existing featured widget code
                            ),
                            SizedBox(height: 24.h),
                          ],
                        ),

                      // Category Filter
                      Text(
                        'Kategori',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: ['Semua', 'Widgets', 'Utils', 'Extensions']
                              .map(
                                (category) => Padding(
                                  padding: EdgeInsets.only(right: 8.w),
                                  child: CategoryTab(
                                    label: category,
                                    isActive:
                                        state.selectedCategory == category,
                                    onTap: () {
                                      context
                                          .read<DocumentationCubit>()
                                          .filterByCategory(category);
                                    },
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      SizedBox(height: 24.h),

                      // Title for features grid
                      Text(
                        'Semua Fitur (${state.displayedFeatures.length})',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(height: 12.h),
                    ]),
                  ),
                ),

                // Features Grid
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 12.w,
                      mainAxisSpacing: 12.h,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return FeatureCard(
                          feature: state.displayedFeatures[index],
                          onTap: () {
                            context
                                .router
                                .push(
                                  DocumentationDetailRoute(
                                    feature: state.displayedFeatures[index],
                                  ),
                                )
                                .then((_) {
                              // Optional: refresh atau do something setelah kembali
                            });
                          },
                        );
                      },
                      childCount: state.displayedFeatures.length,
                    ),
                  ),
                ),

                SliverPadding(
                  padding: EdgeInsets.only(bottom: 32.h),
                ),
              ],
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
```

### Update `documentation_page.dart` (Main Page)

```dart
@RoutePage()
class DocumentationPage extends StatefulWidget {
  const DocumentationPage({super.key});

  @override
  State<DocumentationPage> createState() => _DocumentationPageState();
}

class _DocumentationPageState extends State<DocumentationPage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Load features saat page dibuat
    context.read<DocumentationCubit>().loadFeatures();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DocumentationCubit, DocumentationState>(
        builder: (context, state) {
          return [
            const DocumentationHomePage(),
            const DocumentationChatPage(),
            const DocumentationHistoryPage(),
            const DocumentationProfilePage(),
          ][_selectedIndex];
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(25),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          // ... existing bottom nav bar code
        ),
      ),
    );
  }
}
```

### Wrap dengan BlocProvider di Dashboard

```dart
// Di dashboard atau main entry point
BlocProvider(
  create: (context) => getIt<DocumentationCubit>()..loadFeatures(),
  child: DocumentationPage(),
)
```

## 🧪 Step 5: Testing

Tambahkan unit tests:

```dart
// test/features/documentation/presentation/cubit/documentation_cubit_test.dart

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  group('DocumentationCubit', () {
    late DocumentationCubit documentationCubit;
    late MockGetAllFeaturesUseCase mockGetAllFeaturesUseCase;

    setUp(() {
      mockGetAllFeaturesUseCase = MockGetAllFeaturesUseCase();
      documentationCubit = DocumentationCubit(
        getAllFeaturesUseCase: mockGetAllFeaturesUseCase,
        getFeatureByCategoryUseCase: mockGetFeatureByCategoryUseCase,
      );
    });

    group('loadFeatures', () {
      blocTest<DocumentationCubit, DocumentationState>(
        'emits [DocumentationLoading, DocumentationLoaded] when loadFeatures is called',
        build: () {
          when(mockGetAllFeaturesUseCase.call())
              .thenAnswer((_) async => testFeatures);
          return documentationCubit;
        },
        act: (cubit) => cubit.loadFeatures(),
        expect: () => [
          const DocumentationLoading(),
          isA<DocumentationLoaded>()
              .having((state) => state.allFeatures, 'allFeatures', testFeatures)
              .having((state) => state.displayedFeatures, 'displayedFeatures',
                  testFeatures)
              .having(
                  (state) => state.selectedCategory, 'selectedCategory', 'Semua'),
        ],
      );

      blocTest<DocumentationCubit, DocumentationState>(
        'emits [DocumentationLoading, DocumentationError] when loading fails',
        build: () {
          when(mockGetAllFeaturesUseCase.call()).thenThrow(Exception('Error'));
          return documentationCubit;
        },
        act: (cubit) => cubit.loadFeatures(),
        expect: () => [
          const DocumentationLoading(),
          isA<DocumentationError>(),
        ],
      );
    });

    group('filterByCategory', () {
      blocTest<DocumentationCubit, DocumentationState>(
        'filters features by category',
        seed: () => DocumentationLoaded(
          allFeatures: testFeatures,
          displayedFeatures: testFeatures,
          selectedCategory: 'Semua',
          searchQuery: '',
        ),
        build: () {
          when(mockGetFeatureByCategoryUseCase.call('Widgets'))
              .thenAnswer((_) async => testWidgetFeatures);
          return documentationCubit;
        },
        act: (cubit) => cubit.filterByCategory('Widgets'),
        expect: () => [
          isA<DocumentationLoaded>()
              .having((state) => state.selectedCategory, 'selectedCategory',
                  'Widgets')
              .having((state) => state.displayedFeatures.length,
                  'displayedFeatures.length', 3),
        ],
      );
    });

    group('searchFeatures', () {
      blocTest<DocumentationCubit, DocumentationState>(
        'searches features by query',
        seed: () => DocumentationLoaded(
          allFeatures: testFeatures,
          displayedFeatures: testFeatures,
          selectedCategory: 'Semua',
          searchQuery: '',
        ),
        act: (cubit) => cubit.searchFeatures('button'),
        expect: () => [
          isA<DocumentationLoaded>()
              .having((state) => state.searchQuery, 'searchQuery', 'button')
              .having((state) => state.displayedFeatures.length,
                  'displayedFeatures.length', 1),
        ],
      );
    });
  });
}
```

## ✅ Checklist Implementasi

- [ ] Buat file state (`documentation_state.dart`)
- [ ] Buat file cubit (`documentation_cubit.dart`)
- [ ] Update dependency injection di `injection.dart`
- [ ] Update `documentation_home_page.dart` dengan BlocBuilder
- [ ] Update `documentation_page.dart` untuk load features pada init
- [ ] Wrap page dengan BlocProvider (jika di dashboard)
- [ ] Jalankan tests
- [ ] Test manual di emulator/device

## 📚 Dependencies untuk Testing

Tambahkan di `pubspec.yaml`:

```yaml
dev_dependencies:
  bloc_test: ^9.1.0
  mockito: ^5.4.4
  build_runner: ^2.4.0
```

## 🚀 Tips

1. **Hot Reload**: Cubit akan maintain state saat hot reload
2. **Debugging**: Gunakan `BlocObserver` untuk monitor state changes
3. **Performance**: Gunakan `.select()` untuk rebuild hanya widget yang perlu
4. **Testing**: Selalu test business logic di cubit, bukan di UI
5. **State Immutability**: Pastikan state selalu immutable

## 📖 Referensi

- [Flutter BLoC Documentation](https://bloclibrary.dev/)
- [BLoC Pattern Best Practices](https://bloclibrary.dev/#/flutterweatherbuilder)
- [equatable Package](https://pub.dev/packages/equatable)
- [bloc_test Package](https://pub.dev/packages/bloc_test)
