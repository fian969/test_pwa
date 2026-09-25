import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_setup_clean_architectute/core/color/app_colors.dart';
import 'package:flutter_setup_clean_architectute/core/extensions/rupiah_formatter.dart';
import 'package:flutter_setup_clean_architectute/gen/assets.gen.dart';

enum AppSearchFormType { closable, password, none }

class AppSearchForm extends StatefulWidget {
  final String? hint;
  final String? tempData;
  final TextEditingController? controller;
  final AppSearchFormType type;
  final TextInputType keyboardType;
  final bool isRequired;
  final bool isTextArea;
  final bool isFormatter;
  final bool isSearch;
  final String? Function(String?)? validator;
  final int? maxLength;
  final bool enabled;
  final double? height;
  final Widget? suffixIcon;
  final String? initialValue;
  final void Function(String)? onDebouncedChanged;
  final Color? fillColor;
  final double? costumWidthSuffix;

  const AppSearchForm(
      {super.key,
      this.hint,
      this.controller,
      this.keyboardType = TextInputType.text,
      this.type = AppSearchFormType.none,
      this.isTextArea = false,
      this.isRequired = false,
      this.enabled = true,
      this.validator,
      this.maxLength,
      this.suffixIcon,
      this.isFormatter = false,
      this.tempData,
      this.onDebouncedChanged,
      this.initialValue,
      this.isSearch = false,
      this.fillColor,
      this.costumWidthSuffix,
      this.height});

  @override
  State<AppSearchForm> createState() => _AppSearchFormState();
}

class _AppSearchFormState extends State<AppSearchForm> {
  late FocusNode _focusNode;
  late bool _isObSecure;
  late TextEditingController _controller;
  bool _hasError = false;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _isObSecure = widget.type == AppSearchFormType.password;
    _focusNode = FocusNode();
    _controller = widget.controller ?? TextEditingController();
    if (_controller.text.isEmpty && widget.tempData != null) {
      _controller.text = widget.tempData!;
    }
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
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: widget.isTextArea
            ? (_hasError ? 100.h : 80.h)
            : (_hasError ? 64.h : 56.h),
      ),
      child: SizedBox(
        height: widget.height,
        child: TextFormField(
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
          obscureText: _isObSecure && widget.type == AppSearchFormType.password,
          keyboardType: widget.keyboardType,
          onChanged: _onChangedDebounced,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight:
                widget.fillColor == null ? FontWeight.w600 : FontWeight.w400,
            color: widget.fillColor == null
                ? AppColors.textBlack
                : AppColors.textGrey2,
          ),
          decoration: InputDecoration(
              errorStyle: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w800,
                color: AppColors.danger,
              ),
              hintText: widget.hint,
              hintStyle: TextStyle(
                fontSize: 14.sp,
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
                borderRadius: BorderRadius.circular(16),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16).r,
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16).r,
                borderSide: BorderSide(color: AppColors.primary, width: 1.w),
              ),
              suffixIcon: widget.suffixIcon ?? _buildSuffix(),
              suffixIconConstraints:
                  BoxConstraints.tightFor(width: widget.costumWidthSuffix)),
          validator: (value) => _validateAndSetError(value),
        ),
      ),
    );
  }

  Widget? _buildSuffix() {
    if (widget.type == AppSearchFormType.password) {
      return IconButton(
        onPressed: () => setState(() => _isObSecure = !_isObSecure),
        icon: _isObSecure
            ? Assets.icons.ewallet.dana.svg(
                width: 20,
                height: 20,
                colorFilter: _colorFilter,
              )
            : Assets.icons.ewallet.dana.svg(
                width: 20,
                height: 20,
                colorFilter: _colorFilter,
              ),
      );
    } else if (widget.type == AppSearchFormType.closable &&
        _controller.text.isNotEmpty) {
      return IconButton(
        onPressed: () => _controller.clear(),
        icon: Assets.icons.ewallet.dana.svg(),
      );
    }
    return null;
  }

  ColorFilter? get _colorFilter {
    if (!mounted) return null;
    return _focusNode.hasFocus
        ? ColorFilter.mode(AppColors.primary, BlendMode.srcIn)
        : (_controller.text.isNotEmpty)
            ? ColorFilter.mode(AppColors.textGrey1, BlendMode.srcIn)
            : null;
  }
}
