import 'package:rashed/core/helper/app_size_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/index.dart';

class AppText extends StatelessWidget {
  const AppText(
      {super.key, this.color,
      this.size,
      this.text,
      this.fontFamily,
      this.decoration,
      this.translation,
      this.overflow = TextOverflow.ellipsis,
      this.style,
      this.leading,
      this.trailing,
      this.trailingAlignment,
      this.suffixTranslation,
      this.prefixTranslation,
      this.softWrap = false,
      this.maxLines = 1,
      this.textAlign = TextAlign.start,
      this.fontWeight,
      this.isUpper = false,
      this.addText,
      this.onTap,
      this.backgroundColor,
      this.backgroundColorPadding,
        this.padding = EdgeInsets.zero, this.fittedText = false, this.trailingSpacer = false, this.height,
      });
  final Color? color;
  final double? size;
  final String? text;
  final String? suffixTranslation;
  final String? prefixTranslation;
  final String? translation;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextAlign textAlign;
  final bool? isUpper;
  final bool? softWrap;
  final int maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final Widget? leading;
  final Widget? trailing;
  final MainAxisAlignment? trailingAlignment;
  final TextStyle? style;
  final GestureTapCallback? onTap;
  final String? addText;
  final Color? backgroundColor;
  final EdgeInsets? backgroundColorPadding;
  final dynamic padding;
  final bool fittedText;
  final bool trailingSpacer;
  final double? height;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = style ?? AppTextStyles.medium_24;
    if (color != null) {
      textStyle = textStyle.copyWith(color: color, fontSize: size, fontWeight: fontWeight, decoration: decoration);
    }else{
      textStyle = textStyle.copyWith(fontSize: size, fontWeight: fontWeight, decoration: decoration);

    }
    if(leading != null || trailing != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if(leading != null) ...[
            leading!,
            4.widthBox,
          ],
          buildText(context, textStyle),
          if(trailing != null) ...[
            4.widthBox,
            trailing!
          ]
        ],
      );
    }
    return InkWell(onTap: onTap, child: buildText(context, textStyle));
  }

  Widget buildText(BuildContext context, TextStyle textStyle) {
    if(color == AppColors.white)textStyle.copyWith(color: null);
    String displayText = translation != null && translation!.isNotEmpty ? translation! : text ?? '';
    if (prefixTranslation != null) {
      displayText = '$prefixTranslation $displayText';
    }
    if (suffixTranslation != null) {
      displayText = '$displayText $suffixTranslation ';
    }
    if (addText != null && addText!.isNotEmpty) displayText += '$addText';

    if(backgroundColor != null) {
      return ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: 30.w,
            maxWidth: 70.w,
            minHeight: 20.h,
            maxHeight: 30.h
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: AppCorners.border_8
          ),
          child: Padding(
            padding: backgroundColorPadding?? EdgeInsets.all(12.w),
            child: Center(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  displayText,
                  textAlign: textAlign,
                  overflow: overflow,
                  maxLines: maxLines,
                  softWrap: softWrap,
                  style: textStyle,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return Padding(
      padding: padding,
      child: Text(
        displayText,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        softWrap: softWrap,
        style: maxLines > 1 ? textStyle.copyWith(height: height ?? 1.8.h) : textStyle,
      ),
    );
  }
}
