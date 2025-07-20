import 'package:flutter/material.dart';
import 'package:omedia/src/ui/pages/home_page/home_page.dart';
import 'package:omedia/src/ui/widgets/logo_app_bar.dart';
import 'package:ui_kit/shared/enums.dart';
import 'package:ui_kit/ui_kit.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe8e8e8),
      appBar: LogoAppBar(logoAsset: AppIcon(Assets.logo, height: 52)),
      bottomNavigationBar: AppBottomBar(
        currentTab: BottomBarTab.home,
        onPressed: (value) {},
      ),
      body: HomePage(),
    );
  }
}
