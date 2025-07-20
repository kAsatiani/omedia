import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class LogoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? logoAsset;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onNotificationPressed;
  final VoidCallback? onHelpPressed;

  const LogoAppBar({
    super.key,
    this.logoAsset,
    this.onMenuPressed,
    this.onNotificationPressed,
    this.onHelpPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 8),
            blurRadius: 12,
            spreadRadius: 0,
            color: Color.fromRGBO(0, 0, 0, 0.08),
          ),
        ],
      ),
      child: AppBar(
        actionsPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppIconButton.regular(
            buttonColor: (
              backgroundColor: AppColors.grayLight,
              borderColor: null,
            ),
            icon: (asset: Assets.burger, size: 24),
            onPressed: onMenuPressed ?? () {},
          ),
        ),
        title: logoAsset,
        actions: [
          AppIconButton.regular(
            buttonColor: (
              backgroundColor: AppColors.grayLight,
              borderColor: null,
            ),
            icon: (asset: Assets.bell, size: 24),
            onPressed: onNotificationPressed ?? () {},
          ),
          AppIconButton.regular(
            buttonColor: (
              backgroundColor: AppColors.grayLight,
              borderColor: null,
            ),
            icon: (asset: Assets.question, size: 24),
            onPressed: onHelpPressed ?? () {},
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 5);
}
