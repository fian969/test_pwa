import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/data/datasources/local_documentation_datasource.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/domain/entities/feature_entity.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/presentation/widgets/category_section.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/presentation/widgets/doc_header.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/presentation/widgets/feature_card.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/presentation/widgets/feature_section.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/presentation/widgets/search_bar.dart'
    as doc_search;
import 'package:flutter_setup_clean_architectute/core/navigation/app_router.dart';

@RoutePage()
class DocumentationPage extends StatefulWidget {
  const DocumentationPage({super.key});

  @override
  State<DocumentationPage> createState() => _DocumentationPageState();
}

class _DocumentationPageState extends State<DocumentationPage> {
  late LocalDocumentationDatasource _datasource;
  List<FeatureEntity> _allFeatures = [];
  List<FeatureEntity> _filteredFeatures = [];
  String _selectedCategory = 'Semua';
  String _searchQuery = '';
  final List<String> _categories = ['Semua', 'Widgets', 'Utils', 'Extensions'];

  @override
  void initState() {
    super.initState();
    _datasource = LocalDocumentationDatasourceImpl();
    _loadFeatures();
  }

  Future<void> _loadFeatures() async {
    final features = await _datasource.getAllFeatures();
    setState(() {
      _allFeatures = features;
      _filterFeatures();
    });
  }

  void _filterFeatures() {
    _filteredFeatures = _allFeatures.where((feature) {
      final matchesCategory =
          _selectedCategory == 'Semua' || feature.category == _selectedCategory;
      final matchesSearch =
          feature.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          feature.description.toLowerCase().contains(
            _searchQuery.toLowerCase(),
          );
      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.background,
      child: Column(
        children: [
          DocHeader(onBack: () => context.router.maybePop()),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.all(16.w),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      doc_search.SearchBar(
                        onChanged: (q) => setState(() {
                          _searchQuery = q;
                          _filterFeatures();
                        }),
                      ),
                      SizedBox(height: 16.h),
                      if (_filteredFeatures.isNotEmpty)
                        FeaturedSection(feature: _filteredFeatures.first),
                      CategorySection(
                        categories: _categories,
                        selected: _selectedCategory,
                        onChanged: (c) => setState(() {
                          _selectedCategory = c;
                          _filterFeatures();
                        }),
                      ),
                      Text(
                        'Semua Fitur (${_filteredFeatures.length})',
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
                      (context, index) => FeatureCard(
                        feature: _filteredFeatures[index],
                        onTap: () => context.router.push(
                          DocumentationDetailRoute(
                            feature: _filteredFeatures[index],
                          ),
                        ),
                      ),
                      childCount: _filteredFeatures.length,
                    ),
                  ),
                ),
                SliverPadding(padding: EdgeInsets.only(bottom: 32.h)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
