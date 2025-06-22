import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../helper/index.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key, this.size, this.color});

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: SpinKitFadingCube(
        color: color ?? Theme.of(context).primaryColor,
        size: size ?? 40.sp,
      ),
    );
  }
}
