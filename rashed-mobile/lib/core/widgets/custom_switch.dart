import 'package:flutter/cupertino.dart';
import 'package:rashed/core/helper/index.dart';
import 'package:rashed/core/resources/app_colors.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    super.key,
    required this.onChange,
    this.alignment,
    this.value,
    this.width,
    this.height,
    this.margin,
  });

  final Alignment? alignment;

  final bool? value;

  final Function(bool) onChange;

  final double? width;

  final double? height;

  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 30.w,
      width: width ?? 50.w,
      margin: margin,
      child: alignment != null ? Align(
        alignment: alignment ?? Alignment.center,
        child: switchWidget,
      ) : switchWidget,
    );
  }

  Widget get switchWidget => CupertinoSwitch(
    activeColor: AppColors.primaryDark,
    value: value ?? false,
    onChanged: (value) {
      onChange(value);
    },
  );
}
