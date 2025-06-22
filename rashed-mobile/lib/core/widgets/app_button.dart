import 'package:rashed/core/helper/index.dart';
import 'package:flutter/material.dart';
import '../resources/index.dart';
import 'app_loading.dart';
import 'app_text_display.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    this.height,
    this.translation,
    this.color,
    this.backgroundImage,
    this.textColor = Colors.white,
    this.onTap,
    this.fontSize,
    this.fontWeight = FontWeight.w500,
    this.fontFamily,
    this.textDecoration,
    this.borderRadius,
    this.padding,
    this.decoration,
    this.borderColor,
    this.center = false,
    this.centerText = true,
    this.isLoading = false,
    this.enabled = true,
    this.style,
    this.width, this.suffix, this.preIcon, this.fittedText = false, this.child,
    this.outlined = false,
  });
  final bool center;
  final bool centerText;
  final String? translation;
  final String? backgroundImage;
  final Color textColor;
  final double? fontSize;
  final double? width;
  final double? height;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextDecoration? textDecoration;
  final BoxDecoration? decoration;
  final Widget? suffix;
  final Widget? preIcon;

  final EdgeInsetsGeometry? padding;
  final TextStyle? style;
  final Color? color;
  final Color? borderColor;
  final GestureTapCallback? onTap;
  final bool isLoading;
  final bool enabled;
  final BorderRadiusGeometry? borderRadius;
  final bool fittedText;
  final Widget? child;
  final bool outlined;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {

  late Color? color;

  @override
  void initState() {
    color = widget.color;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) color = AppColors.gray;
    if (widget.isLoading) return const Center(child: AppLoading());
    return InkWell(
      onTap: widget.onTap,
      child: Container(
          width: widget.width,
          height: widget.height,
          padding: widget.padding,
          decoration: widget.decoration ?? BoxDecoration(
            image: widget.backgroundImage == null ? null : DecorationImage(image: AssetImage(widget.backgroundImage!), fit: BoxFit.cover),
            color: widget.outlined ? Colors.transparent : (widget.color ?? AppColors.primaryDark),
            borderRadius: widget.borderRadius ?? AppCorners.border_16,
            border: widget.borderColor == null ? null : Border.all(color: widget.borderColor!, width: 2.0),
          ),
          child: Align(
            alignment: widget.centerText ? Alignment.center : Alignment.centerLeft,
            child: Padding(
              padding: widget.centerText ? EdgeInsets.zero : EdgeInsets.symmetric(horizontal: widget.preIcon != null ? 15.w : 7.0.w),
              child: widget.child ?? AppText(
                translation: widget.translation,
                textAlign: widget.center ? TextAlign.center : TextAlign.start,
                color: widget.textColor,
                size: widget.fontSize,
                fontWeight: widget.fontWeight,
                style: widget.style ?? AppTextStyles.medium_40,
                leading: widget.preIcon,
                trailing: widget.suffix,
                trailingSpacer: !widget.fittedText,
                fittedText: widget.fittedText,
              ),
            ),
          )),
    );
  }
}
