import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; //utiliser les polices Google Fonts dans l'application

//definition des couleurs nom et sa valeurs en hexadecimale
const kBrownColor = Color(0xFF292526);
const kDarkBrownColor = Color(0xFF1b2028);
const kGreyColor = Color(0xffa4AAAd);
const kSecondaryColor = Color(0xFF979797);
const kDarkGreyColor = Color(0xFF878787);
const kLightGreyColor = Color.fromARGB(255, 212, 105, 105);
const kWhiteColor = Color.fromARGB(255, 209, 109, 109);
const kBlackColor = Color(0xFF111111);
const kYellowColor = Color(0xFFFFd33c);
const kBblackColor = Color(0xFF000000);

const kGreysColor = Color.fromARGB(255, 193, 74, 74);

const khintColor = Color(0xff999999);
//definition des styles et demise en forme
const double kBorderRadius = 12.0;
const double kPaddingHorizontal = 24.0;
const double kPaddingVertical = 50.0;
//definition la duree de l'animation utliséé dans l'application
const kAnimationDuration = Duration(milliseconds: 200);
//definit des styles des polices
final kEncodeSansBold = GoogleFonts.encodeSans(
  fontWeight: FontWeight.w700,
);
//definition des styles de bordure
final kInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(kBorderRadius),
    borderSide: const BorderSide(color: kLightGreyColor));
//definit des styles des polices
final kEncodeSansSemiBold = GoogleFonts.encodeSans(
  fontWeight: FontWeight.w600,
);
final kEncodeSansMedium = GoogleFonts.encodeSans(
  fontWeight: FontWeight.w500,
);
final kEncodeSansRagular = GoogleFonts.encodeSans(
  fontWeight: FontWeight.w400,
);
final kEncodeSansCondensedThin = GoogleFonts.encodeSans(
  fontWeight: FontWeight.w200,
);
