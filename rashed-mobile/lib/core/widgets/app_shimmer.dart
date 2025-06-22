import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../resources/app_colors.dart';

class AppShimmer extends StatelessWidget {
  const AppShimmer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.primaryDark.withOpacity(0.2),
      highlightColor: AppColors.primary.withOpacity(0.2),
      child: child,
    );
  }
}
