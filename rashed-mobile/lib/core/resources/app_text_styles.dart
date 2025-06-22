import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rashed/core/helper/size_extension.dart';

import 'app_colors.dart';

class AppCorners {
  static BorderRadius border_16 = BorderRadius.circular(16.r);
  static BorderRadius border_8 = BorderRadius.circular(8.r);
  static BorderRadius border_20 = BorderRadius.circular(20.r);
  static BorderRadius border_28 = BorderRadius.circular(28.r);
  static BorderRadius border_26 = BorderRadius.circular(26.r);
  static BorderRadius border_24 = BorderRadius.circular(24.r);
  static BorderRadius border_40 = BorderRadius.circular(40.r);
  static BorderRadius topBorder_26 = BorderRadius.only(
    topLeft: Radius.circular(26.r),
    topRight: Radius.circular(26.r),
  );
  static BorderRadius bottomBorder_26 = BorderRadius.only(
    bottomLeft: Radius.circular(26.r),
    bottomRight: Radius.circular(26.r),
  );
}

class AppTextStyles {
  static final TextStyle bold_80 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.bold, fontSize: 80.sp);
  static final TextStyle bold_66 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.bold, fontSize: 66.sp);
  static final TextStyle bold_64 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.bold, fontSize: 64.sp);
  static final TextStyle bold_56 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.bold, fontSize: 56.sp);
  static final TextStyle bold_48 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.bold, fontSize: 48.sp);
  static final TextStyle bold_44 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.bold, fontSize: 44.sp);
  static final TextStyle bold_40 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.bold, fontSize: 40.sp);
  static final TextStyle bold_36 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.bold, fontSize: 36.sp);
  static final TextStyle bold_32 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.bold, fontSize: 32.sp);
  static final TextStyle bold_28 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.bold, fontSize: 28.sp);
  static final TextStyle bold_24 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.bold, fontSize: 24.sp);
  static final TextStyle bold_20 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.bold, fontSize: 20.sp);

  static final TextStyle semi_40 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.w600, fontSize: 40.sp);
  static final TextStyle semi_32 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.w600, fontSize: 32.sp);
  static final TextStyle semi_20 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.w600, fontSize: 20.sp);

  static final TextStyle medium_80 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.w500, fontSize: 80.sp);
  static final TextStyle medium_48 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.w500, fontSize: 48.sp);
  static final TextStyle medium_44 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.w500, fontSize: 44.sp);
  static final TextStyle medium_40 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.w500, fontSize: 40.sp);
  static final TextStyle medium_36 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.w500, fontSize: 36.sp);
  static final TextStyle medium_32 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.w500, fontSize: 32.sp);
  static final TextStyle medium_28 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.w500, fontSize: 28.sp);
  static final TextStyle medium_25 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.w500, fontSize: 25.sp);
  static final TextStyle medium_24 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.w500, fontSize: 24.sp);
  static final TextStyle medium_22 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.w500, fontSize: 22.sp);
  static final TextStyle medium_20 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.w500, fontSize: 20.sp);

  static final TextStyle regular_88 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.w400, fontSize: 88.sp);
  static final TextStyle regular_80 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.w400, fontSize: 80.sp);
  static final TextStyle regular_48 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.w400, fontSize: 48.sp);
  static final TextStyle regular_44 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.w400, fontSize: 44.sp);
  static final TextStyle regular_40 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.w400, fontSize: 40.sp);
  static final TextStyle regular_30 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.w400, fontSize: 30.sp);
  static final TextStyle regular_24 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.w400, fontSize: 24.sp);
  static final TextStyle regular_20 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.w400, fontSize: 20.sp);
  static final TextStyle regular_16 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.w400, fontSize: 16.sp);

  static final TextStyle light_15 = GoogleFonts.workSans(color: AppColors.textLight, fontWeight: FontWeight.w300, fontSize: 15.sp);
}
