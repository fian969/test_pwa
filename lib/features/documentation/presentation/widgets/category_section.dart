import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/presentation/widgets/category_tab.dart';

class CategorySection extends StatelessWidget {
  final List<String> categories;
  final String selected;
  final Function(String) onChanged;

  const CategorySection({super.key, required this.categories, required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Kategori', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700, color: AppColors.primary)),
        SizedBox(height: 12.h),
        SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: categories.map((c) => Padding(padding: EdgeInsets.only(right: 8.w), child: CategoryTab(label: c, isActive: selected == c, onTap: () => onChanged(c)))).toList())),
        SizedBox(height: 24.h),
      ],
    );
  }
}
