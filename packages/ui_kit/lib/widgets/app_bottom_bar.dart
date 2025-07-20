import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

import '../shared/shared.dart';

class AppBottomBar extends StatefulWidget {
  final ValueChanged onPressed;
  final BottomBarTab currentTab;

  const AppBottomBar({
    super.key,
    required this.onPressed,
    required this.currentTab,
  });

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  late final List<({String icon, BottomBarTab value})> _buttons = [
    (icon: Assets.requestPage, value: BottomBarTab.newLoans),
    (icon: Assets.attachMoney, value: BottomBarTab.loans),
    (icon: Assets.home, value: BottomBarTab.home),
    (icon: Assets.language, value: BottomBarTab.transactions),
    (icon: Assets.currencyExchange, value: BottomBarTab.currency),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: BottomAppBar(
        color: AppColors.white,
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(_buttons.length, (int i) {
              return Expanded(
                child: _NavButton(
                  onPressed: (v) {
                    if (v == BottomBarTab.home) return;
                    widget.onPressed(v);
                  },
                  icon: _buttons[i].icon,
                  value: _buttons[i].value,
                  selectedValue: widget.currentTab,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatefulWidget {
  final String icon;
  final BottomBarTab value;
  final BottomBarTab selectedValue;
  final ValueChanged<BottomBarTab> onPressed;

  const _NavButton({
    required this.icon,
    required this.value,
    required this.selectedValue,
    required this.onPressed,
  });

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  Widget _button(AppIcon icon) {
    if (widget.value != BottomBarTab.home) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 2,
            child: MaterialButton(
              shape: const CircleBorder(),
              onPressed: () => widget.onPressed(widget.value),
              child: icon,
            ),
          ),
          Expanded(
            child: Text(
              '${widget.value.name}',
              textAlign: TextAlign.center,
              style: TextStyles.roman.copyWith(fontSize: 11),
              maxLines: 1,
            ),
          ),
        ],
      );
    }
    return MaterialButton(
      color: AppColors.primary,
      shape: const CircleBorder(),
      padding: EdgeInsets.all(10),
      onPressed: () => widget.onPressed(widget.value),
      child: AppIcon(
        widget.icon,
        color: AppColors.white,
        height: 24,
        width: 24,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isActive = widget.value == widget.selectedValue;
    final AppIcon icon = AppIcon(
      widget.icon,
      color: isActive ? AppColors.white : null,
      height: 24,
      width: 24,
    );

    return _button(icon);
  }
}
