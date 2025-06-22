import 'package:rashed/core/resources/app_colors.dart';
import 'package:rashed/core/resources/app_text_styles.dart';
import 'package:rashed/core/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.formKey,
    this.alignment,
    this.width,
    this.height,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.textStyle,
    this.obscureText = false,
    this.readOnly = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = false,
    this.enabled = true,
    this.validator, this.formatters, this.onTap, this.onChanged, this.borderColor, this.borderWidth, this.borderRadius, this.labelText,
  });

  final GlobalKey<FormState>? formKey;

  final Alignment? alignment;

  final double? width;

  final double? height;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final bool obscureText;

  final bool readOnly;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? labelText;

  final String? hintText;

  final TextStyle? hintStyle;

  final String? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? borderColor;

  final double? borderRadius;

  final double? borderWidth;

  final Color? fillColor;

  final bool? filled;

  final bool enabled;

  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? formatters;
  final void Function()? onTap;
  final void Function(String value)? onChanged;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  
  bool obscure = false;
  @override
  void initState() {
    obscure = widget.obscureText;
    super.initState();
  }
  
  changeObscure(){
    obscure = !obscure;
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    return widget.alignment != null
        ? Align(
            alignment: widget.alignment ?? Alignment.center,
            child: textFormFieldWidget,
          )
        : textFormFieldWidget;
  }

  Widget get textFormFieldWidget => SizedBox(
        height: widget.height,
        width: widget.width ?? double.maxFinite,
        child: Form(
          key: widget.formKey,
          child: TextFormField(
            enabled: widget.enabled,
            onTap: widget.onTap,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: widget.controller,
            focusNode: widget.focusNode,
            autofocus: widget.autofocus!,
            style: widget.textStyle ?? AppTextStyles.bold_28.copyWith(color: widget.enabled ? AppColors.white : AppColors.textLight.withOpacity(.6)),
            obscureText: obscure,
            textInputAction: widget.textInputAction,
            keyboardType: widget.textInputType,
            maxLines: widget.maxLines ?? 1,
            decoration: decoration,
            validator: widget.validator,
            inputFormatters: widget.formatters,
            readOnly: widget.readOnly,
            onChanged: widget.onChanged,
            cursorColor: Theme.of(context).primaryColor,
          ),
        ),
      );

  InputDecoration get decoration => InputDecoration(
    alignLabelWithHint: true,
    border: OutlineInputBorder(borderSide: BorderSide(color: widget.borderColor ?? Colors.white), borderRadius: BorderRadius.circular(widget.borderRadius ?? 16.r)),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: widget.borderColor ?? Colors.white, width: widget.borderWidth ?? 2), borderRadius: BorderRadius.circular(widget.borderRadius ?? 16.r)),
    labelText: widget.labelText,
    labelStyle: AppTextStyles.medium_24,
    hintText: widget.hintText ?? "",
    hintStyle: widget.hintStyle ?? AppTextStyles.medium_24.copyWith(color: AppColors.white.withOpacity(.5)),
    prefixIcon: widget.prefix == null ? null : CustomImageView(imagePath: widget.prefix, margin: EdgeInsets.symmetric(horizontal: 15.w)),
    prefixIconConstraints: widget.prefixConstraints ?? const BoxConstraints(maxWidth: 44, maxHeight: 30),
    prefixIconColor: Theme.of(context).primaryColor,
    suffixIcon: suffixIcon,
    suffixIconConstraints: widget.suffixConstraints ?? const BoxConstraints(maxWidth: 48, maxHeight: 24),
    suffixIconColor: Theme.of(context).primaryColor,
    contentPadding: widget.contentPadding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
    fillColor: widget.fillColor,
    filled: widget.filled,
    errorMaxLines: 2,
  );

  Widget? get suffixIcon {
    return widget.obscureText ? InkWell(
      onTap: changeObscure,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Icon(obscure ? Icons.visibility_off : Icons.visibility, color: Colors.white),
      ),
    ) : widget.suffix;
  }
}
