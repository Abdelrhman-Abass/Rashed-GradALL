import 'package:rashed/core/helper/index.dart';
import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/app_text_styles.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.color,
    this.borderRadius,
    this.padding,
    this.loading,
    this.width,
    this.height,
    this.elevation = false,
    this.border,
    this.onTap,
  });

  final Widget child;
  final Color? color;
  final BoxBorder? border;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final bool? loading;
  final bool elevation;
  final double? width;
  final double? height;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return loading??false ? const Center(child: CircularProgressIndicator.adaptive()) : InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: color?? Theme.of(context).cardColor,
          border: border,
          borderRadius: borderRadius ?? AppCorners.border_8,
          boxShadow: [
            if(elevation) BoxShadow(
              color: AppColors.black,
              offset: const Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Padding(
          padding: padding ?? EdgeInsets.all(16.r),
          child: child,
        ),
      ),
    );
  }
}
