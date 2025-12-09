import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontStyles {
  /// Reusable title text style for cards and section headers
  static TextStyle titleStyle(BuildContext context) {
    final scaler = MediaQuery.of(context).textScaler;
    final width = MediaQuery.of(context).size.width;

    // Base font size scales with screen width
    final baseSize = width * 0.015; 

    return GoogleFonts.nunitoSans(
      fontWeight: FontWeight.w700,
      fontSize: scaler.scale(baseSize.clamp(16, 28)),
      color: const Color(0xFF182C32), // dark teal 
      letterSpacing: 0.5,
      height: 1.1,
    );
  }

  /// Optional smaller subtitle or section label
  static TextStyle subtitleStyle(BuildContext context) {
    final scaler = MediaQuery.of(context).textScaler;
    return GoogleFonts.nunitoSans(
      fontWeight: FontWeight.w600,
      fontSize: scaler.scale(14),
      color: const Color(0xFF182C32),
      letterSpacing: 1.2,
    );
  }

  /// Optional body text style for blurbs
  static TextStyle bodyStyle(BuildContext context) {
    final scaler = MediaQuery.of(context).textScaler;
    return GoogleFonts.nunitoSans(
      fontWeight: FontWeight.w400,
      fontSize: scaler.scale(15),
      color: Colors.black.withOpacity(0.8),
      height: 1.5,
    );
  }
}