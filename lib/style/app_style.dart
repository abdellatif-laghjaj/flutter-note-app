import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  //set up main colors
  static Color mainColor = const Color(0xFF1E2129);
  static Color accentColor = const Color(0xFFFBBD08);
  static Color backgroundColor = const Color(0xFF4285F4);

  //set up cards colors
  static List<Color> cardsColor = [
    Colors.white,
    Colors.red.shade200,
    Colors.green.shade200,
    Colors.blue.shade200,
    Colors.yellow.shade200,
    Colors.purple.shade200,
    Colors.orange.shade200,
    Colors.pink.shade200,
    Colors.teal.shade200,
    Colors.cyan.shade200,
    Colors.indigo.shade200,
  ];

  //set up text styles
  static TextStyle mainTitle = GoogleFonts.roboto(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );

  static TextStyle mainContent = GoogleFonts.poppins(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
  );

  static TextStyle dateTitle = GoogleFonts.poppins(
    fontSize: 13.0,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
  );
}
