import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/presentation/widgets/glass_container.dart';

class SearchBar extends StatefulWidget {
  final Function(String)? onChanged;
  final String? hintText;

  const SearchBar({
    super.key,
    this.onChanged,
    this.hintText = 'Cari fitur...',
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      borderRadius: 25,
      blurStrength: 12,
      glassColor: const Color(0xFFFFFFFF),
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 0,
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: AppColors.grey1.withAlpha(150),
            size: 20.sp,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: TextField(
              controller: _controller,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: AppColors.grey1.withAlpha(150),
                  fontSize: 13.sp,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 12.h,
                ),
              ),
              style: TextStyle(
                fontSize: 13.sp,
                color: AppColors.textBlack,
              ),
            ),
          ),
          if (_controller.text.isNotEmpty)
            GestureDetector(
              onTap: () {
                _controller.clear();
                widget.onChanged?.call('');
              },
              child: Icon(
                Icons.close,
                color: AppColors.grey1.withAlpha(150),
                size: 18.sp,
              ),
            ),
        ],
      ),
    );
  }
}
