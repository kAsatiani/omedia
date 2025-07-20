import 'package:flutter/material.dart';
import 'package:ui_kit/themes/app_colors.dart';

class TextStyles {
  TextStyles._();

  static TextTheme get textTheme => const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'HelveticaNeue',
      fontWeight: FontWeight.w700, // Bold
      fontSize: 57,
      height: 1.12,
      letterSpacing: -0.25,
    ),
    displayMedium: TextStyle(
      fontFamily: 'HelveticaNeue',
      fontWeight: FontWeight.w700, // Bold
      fontSize: 45,
      height: 1.16,
    ),
    displaySmall: TextStyle(
      fontFamily: 'HelveticaNeue',
      fontWeight: FontWeight.w500, // Medium
      fontSize: 36,
      height: 1.22,
    ),

    // Headline styles
    headlineLarge: TextStyle(
      fontFamily: 'HelveticaNeue',
      fontWeight: FontWeight.w700, // Bold
      fontSize: 32,
      height: 1.25,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'HelveticaNeue',
      fontWeight: FontWeight.w700, // Bold
      fontSize: 28,
      height: 1.29,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'HelveticaNeue',
      fontWeight: FontWeight.w500, // Medium
      fontSize: 24,
      height: 1.33,
    ),

    // Title styles
    titleLarge: TextStyle(
      fontFamily: 'HelveticaNeue',
      fontWeight: FontWeight.w700, // Bold
      fontSize: 22,
      height: 1.27,
    ),
    titleMedium: TextStyle(
      fontFamily: 'HelveticaNeue',
      fontWeight: FontWeight.w500, // Medium
      fontSize: 16,
      height: 1.5,
      letterSpacing: 0.15,
    ),
    titleSmall: TextStyle(
      fontFamily: 'HelveticaNeue',
      fontWeight: FontWeight.w500, // Medium
      fontSize: 14,
      height: 1.43,
      letterSpacing: 0.1,
    ),

    // Body styles
    bodyLarge: TextStyle(
      fontFamily: 'HelveticaNeue',
      fontWeight: FontWeight.w400, // Roman
      fontSize: 16,
      height: 1.5,
      letterSpacing: 0.5,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'HelveticaNeue',
      fontWeight: FontWeight.w400, // Roman
      fontSize: 14,
      height: 1.43,
      letterSpacing: 0.25,
    ),
    bodySmall: TextStyle(
      fontFamily: 'HelveticaNeue',
      fontWeight: FontWeight.w400, // Roman
      fontSize: 12,
      height: 1.33,
      letterSpacing: 0.4,
    ),

    // Label styles
    labelLarge: TextStyle(
      fontFamily: 'HelveticaNeue',
      fontWeight: FontWeight.w700, // Bold
      fontSize: 14,
      height: 1.43,
      letterSpacing: 0.1,
    ),
    labelMedium: TextStyle(
      fontFamily: 'HelveticaNeue',
      fontWeight: FontWeight.w500, // Medium
      fontSize: 12,
      height: 1.33,
      letterSpacing: 0.5,
    ),
    labelSmall: TextStyle(
      fontFamily: 'HelveticaNeue',
      fontWeight: FontWeight.w500, // Medium
      fontSize: 11,
      height: 1.45,
      letterSpacing: 0.5,
    ),
  );

  // Individual style getters for direct access
  static const TextStyle displayLarge = TextStyle(
    fontFamily: 'HelveticaNeue',
    fontWeight: FontWeight.w700,
    fontSize: 57,
    height: 1.12,
    letterSpacing: -0.25,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: 'HelveticaNeue',
    fontWeight: FontWeight.w700,
    fontSize: 45,
    height: 1.16,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: 'HelveticaNeue',
    fontWeight: FontWeight.w500,
    fontSize: 36,
    height: 1.22,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontFamily: 'HelveticaNeue',
    fontWeight: FontWeight.w700,
    fontSize: 32,
    height: 1.25,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: 'HelveticaNeue',
    fontWeight: FontWeight.w700,
    fontSize: 28,
    height: 1.29,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: 'HelveticaNeue',
    fontWeight: FontWeight.w500,
    fontSize: 24,
    height: 1.33,
  );

  static const TextStyle titleLarge = TextStyle(
    fontFamily: 'HelveticaNeue',
    fontWeight: FontWeight.w700,
    fontSize: 22,
    height: 1.27,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: 'HelveticaNeue',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 1.5,
    letterSpacing: 0.15,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: 'HelveticaNeue',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 1.43,
    letterSpacing: 0.1,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: 'HelveticaNeue',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.5,
    letterSpacing: 0.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: 'HelveticaNeue',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.43,
    letterSpacing: 0.25,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: 'HelveticaNeue',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1.33,
    letterSpacing: 0.4,
  );

  static const TextStyle labelLarge = TextStyle(
    fontFamily: 'HelveticaNeue',
    fontWeight: FontWeight.w700,
    fontSize: 14,
    height: 1.43,
    letterSpacing: 0.1,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: 'HelveticaNeue',
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 1.33,
    letterSpacing: 0.5,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: 'HelveticaNeue',
    fontWeight: FontWeight.w500,
    fontSize: 11,
    height: 1.45,
    letterSpacing: 0.5,
  );

  // Custom utility styles using different font weights
  static const TextStyle thin = TextStyle(
    fontFamily: 'HelveticaNeue',
    fontWeight: FontWeight.w200,
  );

  static const TextStyle light = TextStyle(
    fontFamily: 'HelveticaNeue',
    fontWeight: FontWeight.w300,
  );

  static const TextStyle roman = TextStyle(
    fontFamily: 'HelveticaNeue',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle medium = TextStyle(
    fontFamily: 'HelveticaNeue',
    fontWeight: FontWeight.w500,
  );

  static const TextStyle bold = TextStyle(
    fontFamily: 'HelveticaNeue',
    fontWeight: FontWeight.w700,
  );

  static const TextStyle currency = TextStyle(
    fontFamily: 'BPG',
    fontWeight: FontWeight.w400,
    color: AppColors.grayMedium,
  );
}
