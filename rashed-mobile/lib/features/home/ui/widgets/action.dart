import 'package:flutter/material.dart';
import 'package:rashed/core/helper/index.dart';

import '../../../../core/resources/index.dart';
import '../../../../core/widgets/index.dart';

class ActionWidget extends StatelessWidget {
  const ActionWidget ({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: AppText(translation: text, style: AppTextStyles.medium_24, color: AppColors.textDark, maxLines: 3)),
        5.widthBox,
        CustomImageView(imagePath: AppImages.back, fit: BoxFit.scaleDown, width: 35.w, height: 25.h, color: AppColors.textDark, reverse: true),
        15.widthBox,
      ],
    );
  }
}
