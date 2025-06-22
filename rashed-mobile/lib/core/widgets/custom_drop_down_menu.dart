import 'package:flutter/material.dart';
import 'package:rashed/core/helper/index.dart';
import 'package:rashed/core/resources/index.dart';

import 'app_text_display.dart';
import 'custom_image_view.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String? label;
  final List<T> items;
  final T? value;
  final String? hintText;
  final void Function(T?) onChanged;
  final String Function(T)? itemLabelBuilder;
  final InputDecoration? decoration;
  final EdgeInsetsGeometry? contentPadding;
  final String? prefix;
  final BoxConstraints? prefixConstraints;
  final bool enabled;

  const CustomDropdown({
    super.key,
    this.label,
    required this.items,
    required this.value,
    required this.onChanged,
    this.hintText,
    this.itemLabelBuilder,
    this.decoration,
    this.contentPadding,
    this.prefix,
    this.prefixConstraints,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: decoration ??
          InputDecoration(
            enabled: enabled,
            alignLabelWithHint: true,
            labelText: value == null ? null : label,
            labelStyle: AppTextStyles.medium_24,
            prefixIcon: prefix == null ? null : CustomImageView(imagePath: prefix, margin: EdgeInsets.symmetric(horizontal: 10.w)),
            prefixIconConstraints: prefixConstraints ?? BoxConstraints(maxWidth: 48.w, maxHeight: 24.h),
            prefixIconColor: Theme.of(context).primaryColor,
            contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            errorMaxLines: 2,
            filled: true,
            fillColor: Theme.of(context).cardColor,
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(8),
            // ),
          ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          isExpanded: true,
          isDense: true,
          dropdownColor: Theme.of(context).cardColor,
          focusColor: Colors.white,
          hint: AppText(translation: hintText, style: AppTextStyles.medium_20.copyWith(color: enabled ? Theme.of(context).primaryColorLight : Theme.of(context).primaryColorLight.withOpacity(.6))),
          items: items.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: AppText(translation: itemLabelBuilder != null ? itemLabelBuilder!(item) : item.toString(), style: AppTextStyles.bold_28.copyWith(color: Theme.of(context).primaryColorDark)),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
