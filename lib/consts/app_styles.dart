import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppStyles {
  static TextStyle kHeader = GoogleFonts.acme(
    color: AppColors.kWhiteColor,
    fontSize: 30,
  );

  static TextStyle kContent = GoogleFonts.acme(
    fontSize: 20,
    color: AppColors.kWhiteColor,
  );

  static TextStyle kAuthor = GoogleFonts.acme(
    fontSize: 18,
    color: AppColors.kWhiteColor,
  );
  static TextStyle kGetQuote = GoogleFonts.acme(
    color: AppColors.kWhiteColor,
    fontSize: 20,
  );
}
