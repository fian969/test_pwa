import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/gen/assets.gen.dart';

class AppDropdown<T> extends StatefulWidget {
  final String hint;
  final double radius;
  final T? value;
  final List<T> values;
  final double? height;
  final double? menuHeight;
  final double contentPaddingRight;
  final ValueChanged<T>? onChanged;
  final Widget Function(T value)? builder;
  final Widget Function(T value)? selectedBuilder;
  final String? Function(T?)? validator;

  const AppDropdown({
    super.key,
    required this.hint,
    required this.value,
    required this.values,
    required this.onChanged,
    this.builder,
    this.selectedBuilder,
    this.radius = 8,
    this.height,
    this.contentPaddingRight = 0,
    this.validator,
    this.menuHeight,
  });

  @override
  State<AppDropdown> createState() => _AppDropdownState<T>();
}

class _AppDropdownState<T> extends State<AppDropdown<T>> {
  T? _value;
  bool _isErrorExpanded = false;
  String? _errorMessage;

  @override
  void initState() {
    _value = widget.value;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AppDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      setState(() {
        _value = widget.value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: widget.height ?? 56.h,
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButtonFormField<T>(
              validator: (v) {
                String? error = widget.validator?.call(v);
                setState(() {
                  _isErrorExpanded = error != null;
                  _errorMessage = error;
                });
                return null;
              },
              menuMaxHeight: widget.menuHeight,
              padding: EdgeInsets.zero,
              iconSize: 30,
              isDense: true,
              isExpanded: true,
              initialValue: _value,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.textBlack,
              ),
              hint: Text(
                widget.hint,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey1,
                ),
              ),
              icon: Assets.icons.ewallet.dana
                  .svg(height: 20, width: 20, colorFilter: _colorFilter),
              dropdownColor: Colors.white,
              decoration: InputDecoration(
                filled: true,
                fillColor: widget.onChanged == null
                    ? const Color(0xFFF4F4F4)
                    : Colors.white,
                contentPadding:
                    EdgeInsets.only(right: widget.contentPaddingRight),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius),
                  borderSide: BorderSide(
                    color:
                        _isErrorExpanded ? AppColors.danger : AppColors.grey1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius),
                  borderSide: BorderSide(
                    color:
                        _isErrorExpanded ? AppColors.danger : AppColors.grey1,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius),
                  borderSide: BorderSide(
                    color:
                        _isErrorExpanded ? AppColors.danger : AppColors.grey3,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius),
                  borderSide: BorderSide(
                    color:
                        _isErrorExpanded ? AppColors.danger : AppColors.primary,
                  ),
                ),
              ),
              onChanged: widget.onChanged == null
                  ? null
                  : (T? value) {
                      setState(() => _value = value);
                      if (value != null) widget.onChanged!(value);
                    },
              selectedItemBuilder: widget.selectedBuilder == null
                  ? null
                  : (_) {
                      return widget.values
                          .map((e) => widget.selectedBuilder!(e))
                          .toList();
                    },
              items: widget.values.map((v) {
                return DropdownMenuItem<T>(
                  value: v,
                  child: widget.builder != null
                      ? widget.builder!(v)
                      : Text(v.toString()),
                );
              }).toList(),
            ),
          ),
        ),
        if (_isErrorExpanded && _errorMessage != null)
          Text(
            _errorMessage!,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.danger,
            ),
          ),
      ],
    );
  }

  ColorFilter? get _colorFilter => ColorFilter.mode(
        AppColors.textGrey1,
        BlendMode.srcIn,
      );
}
