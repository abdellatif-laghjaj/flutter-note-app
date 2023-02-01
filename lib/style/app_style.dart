import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  //set up main colors
  static Color mainColor = Color(0xFF1E88E5);
  static Color accentColor = Color(0xFF1E88E5);
  static Color backgroundColor = Color(0xFFe8e8e8);

  //set up cards colors
  static List<Color> cardsColor = [
    Colors.white,
    Colors.red.shade300,
    Colors.green.shade300,
    Colors.blue.shade300,
    Colors.yellow.shade300,
    Colors.purple.shade300,
    Colors.orange.shade300,
    Colors.pink.shade300,
    Colors.teal.shade300,
    Colors.cyan.shade300,
    Colors.indigo.shade300,
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
    fontWeight: FontWeight.w500,
  );
}