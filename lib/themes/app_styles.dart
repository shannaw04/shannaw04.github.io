import 'package:flutter/material.dart';

class AppColors {
  static const darkBackground = Color(0xFF1f7382);       
  static const darkAccentGray = Color.fromARGB(255, 81, 95, 100);   
  static const darkAccentBlue = Color.fromARGB(255, 24, 44, 50);       
  static const lightBackground1 = Color.fromARGB(255, 255, 255, 255);
  static const lightBackground2 = Color.fromARGB(255, 233, 233, 235);
}

class AppStyles {
  static Widget titleUnderline({
    double height = 2,
    Color color = AppColors.darkAccentGray,
    double radius = 999,
    EdgeInsetsGeometry margin = const EdgeInsets.only(top: 2, bottom: 8),
  }) {
    return Container(
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

class AppTextures {
  static const cubes = 'assets/textures/cubes.png';
}


