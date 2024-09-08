import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:todo_cube/utils/appcolors.dart';

class AppTextStyles {
  static final TextStyle headingBold = GoogleFonts.manrope(
    textStyle: const TextStyle(
      color: AppColors.textSecondary,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  );
  static final TextStyle heading = GoogleFonts.manrope(
    textStyle: const TextStyle(
      fontSize: 23,
    ),
  );
  static final TextStyle bodyText = GoogleFonts.manrope(
    textStyle: const TextStyle(
      fontSize: 16,
      color: Colors.black,
    ),
  );
  static final TextStyle bodyTextBold = GoogleFonts.manrope(
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  );
  static final TextStyle bodySmall = GoogleFonts.manrope(
    textStyle: const TextStyle(
      fontSize: 14,
    ),
  );
  static final TextStyle bodyItems = GoogleFonts.manrope(
    textStyle: const TextStyle(
      fontSize: 14,
      color: Colors.red,
    ),
  );
  static final TextStyle buttonTextWhite = GoogleFonts.manrope(
    textStyle: const TextStyle(fontSize: 16, color: AppColors.textWhite),
  );
  static final TextStyle errorTextMessage = GoogleFonts.manrope(
    textStyle: const TextStyle(fontSize: 13, color: AppColors.errorText),
  );
}
