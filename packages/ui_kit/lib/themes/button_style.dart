import 'package:flutter/material.dart';
import 'package:ui_kit/themes/app_colors.dart';
import 'package:ui_kit/themes/text_styles.dart';

enum AppButtonType { primary, primaryLight, text }

abstract final class AppButtonStyle {
  static ButtonStyle getStyle(BuildContext context, AppButtonType type) {
    final Color primary = AppColors.primary;

    const RoundedRectangleBorder defaultRadius = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    );

    TextStyle defaultTextStyle = TextStyles.roman.copyWith(
      fontSize: 13,
      color: Colors.white,
    );

    return switch (type) {
      AppButtonType.primary => ElevatedButton.styleFrom(
        backgroundColor: primary,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: defaultRadius,
        textStyle: defaultTextStyle,
      ),

      AppButtonType.text => TextButton.styleFrom(
        textStyle: defaultTextStyle,
        padding: const EdgeInsets.symmetric(vertical: 12),
        backgroundColor: primary,
        shape: defaultRadius,
      ),
      AppButtonType.primaryLight => ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryLight,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: defaultRadius,
        textStyle: defaultTextStyle.copyWith(color: AppColors.primaryDark),
      ),
    };
  }
}
