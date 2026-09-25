import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/core/extensions/rupiah_formatter.dart';
import 'package:flutter_setup_clean_architectute/gen/assets.gen.dart';

enum AppFieldType { closable, password, none }

class AppField extends StatefulWidget {
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final String? hint;
  final String? tempData;
  final TextEditingController? controller;
  final AppFieldType type;
  final TextInputType keyboardType;
  final bool isRequired;
  final bool isTextArea;
  final bool isFormatter;
  final bool isSearch;
  final String? Function(String?)? validator;
  final int? maxLength;
  final bool enabled;
  final Widget? suffixIcon;
  final String? initialValue;
  final void Function(String)? onDebouncedChanged;
  final Color? fillColor;
  final double? costumWidthSuffix;
  final double fontSize;
  final double? width;
  final bool isBoxShadow;
  final bool showBorder;

  const AppField({
    super.key,
    this.hint,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.type = AppFieldType.none,
    this.isTextArea = false,
    this.isRequired = false,
    this.enabled = true,
    this.validator,
    this.maxLength,
    this.backgroundColor,
    this.suffixIcon,
    this.isFormatter = false,
    this.tempData,
    this.onDebouncedChanged,
    this.initialValue,
    this.prefixIcon,
    this.hintStyle,
    this.isSearch = false,
    this.fillColor,
    this.costumWidthSuffix,
    this.width,
    this.isBoxShadow = false,
    this.showBorder = true,
    this.fontSize = 14,
  });

  @override
  State<AppField> createState() => _AppFieldState();
}

class _AppFieldState extends State<AppField> {
  late FocusNode _focusNode;
  late bool _isObSecure;
  late TextEditingController _controller;
  bool _hasError = false;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _isObSecure = widget.type == AppFieldType.password;
    _focusNode = FocusNode();
    _controller = widget.controller ?? TextEditingController();

    if (_controller.text.isEmpty && widget.tempData != null) {
      _controller.text = widget.tempData!;
    }

    _controller.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _focusNode.dispose();
    if (widget.controller == null) _controller.dispose();
    super.dispose();
  }

  String? _validateAndSetError(String? value) {
    final error = widget.validator?.call(value);
    if (mounted && _hasError != (error != null && error.isNotEmpty)) {
      setState(() => _hasError = error != null && error.isNotEmpty);
    }
    return error;
  }

  void _onChangedDebounced(String value) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      if (mounted && widget.onDebouncedChanged != null) {
        widget.onDebouncedChanged!(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        boxShadow: widget.isBoxShadow
            ? [
                BoxShadow(
                  color: AppColors.textBlack.withValues(alpha: 0.4),
                  spreadRadius: -7,
                  blurRadius: 10,
                  offset: const Offset(1, 0),
                ),
              ]
            : null,
      ),
      constraints: BoxConstraints(
        minHeight: widget.isTextArea
            ? (_hasError ? 100.h : 80.h)
            : (_hasError ? 64.h : 56.h),
      ),
      child: SizedBox(
        width: widget.width,
        height: widget.isTextArea ? 80.h : 56.h,
        child: Column(
          children: [
            TextFormField(
              initialValue: widget.initialValue,
              maxLength: widget.maxLength,
              inputFormatters: widget.isFormatter ? [RupiahFormatter()] : null,
              enabled: widget.enabled,
              buildCounter: (context,
                      {required currentLength, required isFocused, maxLength}) =>
                  null,
              controller: _controller,
              focusNode: _focusNode,
              maxLines: widget.isTextArea ? 4 : 1,
              obscureText: _isObSecure && widget.type == AppFieldType.password,
              keyboardType: widget.keyboardType,
              onChanged: _onChangedDebounced,
              style: TextStyle(
                fontSize: widget.fontSize.sp,
                fontWeight:
                    widget.fillColor == null ? FontWeight.w600 : FontWeight.w400,
                color: widget.fillColor == null
                    ? AppColors.textBlack
                    : AppColors.textGrey2,
              ),
              decoration: InputDecoration(
                  prefixIcon: widget.prefixIcon,
                  errorStyle: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.danger,
                  ),
                  hintText: widget.hint,
                  hintStyle: widget.hintStyle ??
                      TextStyle(
                        fontSize: widget.fontSize.sp,
                        fontWeight: FontWeight.normal,
                        color: AppColors.textGrey1,
                      ),
                  filled: true,
                  fillColor: widget.fillColor ?? AppColors.white,
                  prefix: SizedBox(width: 16.w),
                  contentPadding: widget.isTextArea
                      ? const EdgeInsets.only(top: 16)
                      : EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColors.grey2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8).r,
                    borderSide: widget.showBorder
                        ? BorderSide(
                            color: (_controller.text.isNotEmpty)
                                ? (widget.isSearch)
                                    ? AppColors.grey1.withValues(alpha: 0.6)
                                    : AppColors.grey2
                                : AppColors.grey1,
                          )
                        : BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8).r,
                    borderSide: BorderSide(color: AppColors.primary, width: 1.w),
                  ),
                  suffixIcon: widget.suffixIcon ?? _buildSuffix(),
                  suffixIconConstraints:
                      BoxConstraints.tightFor(width: widget.costumWidthSuffix)),
              validator: (value) => _validateAndSetError(value),
            ),
          ],
        ),
      ),
    );
  }

  Widget? _buildSuffix() {
    if (widget.type == AppFieldType.password) {
      return IconButton(
        onPressed: () => setState(() => _isObSecure = !_isObSecure),
        icon: _isObSecure
            ? Assets.icons.broken.eyeSlash.svg(
                width: 20,
                height: 20,
                colorFilter:
                    ColorFilter.mode(AppColors.textGrey1, BlendMode.srcIn),
              )
            : Assets.icons.broken.eye.svg(
                width: 20,
                height: 20,
                colorFilter:
                    ColorFilter.mode(AppColors.textGrey1, BlendMode.srcIn),
              ),
      );
    } else if (widget.type == AppFieldType.closable &&
        _controller.text.isNotEmpty) {
      return IconButton(
        onPressed: () => _controller.clear(),
        icon: Assets.icons.bold.closeCircle.svg(),
      );
    }
    return null;
  }

  // ColorFilter? get _colorFilter {
  //   if (!mounted) return null;
  //   return _focusNode.hasFocus
  //       ? ColorFilter.mode(AppColors.primary, BlendMode.srcIn)
  //       : (_controller.text.isNotEmpty)
  //           ? ColorFilter.mode(AppColors.textGrey1, BlendMode.srcIn)
  //           : null;
  // }
}
