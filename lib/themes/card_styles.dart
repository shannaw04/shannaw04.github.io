import 'package:flutter/material.dart';
import 'package:portfolio/themes/app_styles.dart';

class Decorations {
  static BoxDecoration cardDecoration = BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(16)),

    border: Border.all(
      color: AppColors.darkAccentGray,
      width: 5,
    ),

    // Add texture background
    image: const DecorationImage(
      image: AssetImage(AppTextures.cubes),
      repeat: ImageRepeat.repeat,
      opacity: 0.75,
    ),

    // Gradient overlay
    gradient: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.lightBackground1,
        AppColors.lightBackground2,
      ],
    ),

    boxShadow: [
      BoxShadow( 
        color: Colors.grey.shade800, 
        blurRadius: 16, 
        offset: const Offset(0,8),
      ),
    ],
  );
}
