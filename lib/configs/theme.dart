import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kBlueColor = Colors.blue;
Color? kDarkBlueColor = Colors.blue[800];
const Color kWhiteColor = Colors.white;
const Color kBlackColor = Colors.black;
const Color kGreyColor = Colors.grey;
const Color kBackgroundColor = Color(0xfffafafa);
const Color kCreamColor = Color(0xffffffe1);
Color? kGrey100Color = Colors.grey[100];
Color? kGrey200Color = Colors.grey[200];
const Color kBlackThemeColor = Color(0xff121212);
const Color kBlack45Color = Colors.black45;
const Color kGreenColor = Color(0xff00aa4a);
const Color kRedColor = Colors.red;
const Color kRedAccentColor = Colors.red;
const Color kAmberColor = Color(0xfffda50f);
const Color kYellowColor = Color(0xffffe472);

class Themes {
  static light(BuildContext context) {
    return ThemeData.light().copyWith(
      primaryColor: const Color(0xff008c45),
      backgroundColor: Colors.grey[100],
      // textSelectionTheme:
      //     const TextSelectionThemeData(selectionColor: kBlackColor),
      textTheme: GoogleFonts.latoTextTheme(
        Theme.of(context).textTheme,
      ),
    );
  }

  static dark(BuildContext context) {
    return ThemeData.dark().copyWith(
      primaryColor: const Color(0xff008c45),
      backgroundColor: const Color(0xff303030),
      textSelectionTheme:
          const TextSelectionThemeData(selectionColor: kWhiteColor),
      textTheme: GoogleFonts.latoTextTheme(
        Theme.of(context).textTheme,
      ),
    );
  }
}
