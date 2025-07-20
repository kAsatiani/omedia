import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

enum AppBarType { details, success }

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar.details({super.key}) : type = AppBarType.details;
  const CustomAppBar.success({super.key}) : type = AppBarType.success;

  final AppBarType type;

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
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: type == AppBarType.success
            ? null
            : Padding(
                padding: EdgeInsets.fromLTRB(16, 6, 0, 6),
                child: AppIconButton.regular(
                  buttonColor: (
                    backgroundColor: AppColors.grayLight,
                    borderColor: null,
                  ),
                  icon: (asset: Assets.arrowLeft, size: 24),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
        actions: [
          if (type == AppBarType.success)
            AppIconButton.regular(
              icon: (asset: Assets.close, size: 24),
              onPressed: () => Navigator.pop(context),
            ),
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'დავალიანების გადახდა',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'მთავარი',
              style: TextStyles.medium.copyWith(
                color: AppColors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 5);
}
