import 'package:flutter/material.dart';
import 'package:ui_kit/widgets/app_icon.dart';

enum AppIconButtonType { circular, regular }

class AppIconButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final EdgeInsets? padding;
  final ({String asset, double size}) icon;
  final Color? iconColor;
  final ({Color? backgroundColor, Color? borderColor})? buttonColor;
  final AppIconButtonType buttonType;
  final LinearGradient? gradient;
  final List<BoxShadow>? boxShadow;

  const AppIconButton.circular({
    super.key,
    this.padding,
    required this.icon,
    this.onPressed,
    this.buttonColor,
    this.iconColor,
    this.gradient,
    this.boxShadow,
  }) : buttonType = AppIconButtonType.circular;
  const AppIconButton.regular({
    super.key,
    this.padding,
    required this.icon,
    this.onPressed,
    this.buttonColor,
    this.iconColor,
    this.gradient,
    this.boxShadow,
  }) : buttonType = AppIconButtonType.regular;

  @override
  State<AppIconButton> createState() => _AppIconButtonState();
}

class _AppIconButtonState extends State<AppIconButton> {
  late final EdgeInsets buttonPadding =
      widget.buttonType == AppIconButtonType.circular
      ? EdgeInsets.all(10)
      : EdgeInsets.symmetric(horizontal: 8, vertical: 8);

  late final OutlinedBorder shape =
      widget.buttonType == AppIconButtonType.circular
      ? CircleBorder()
      : RoundedRectangleBorder(borderRadius: BorderRadius.circular(12));

  late final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    minimumSize: Size.zero,
    backgroundColor: widget.gradient != null
        ? Colors.transparent
        : widget.buttonColor?.backgroundColor ?? Colors.transparent,
    side: widget.buttonColor?.borderColor != null
        ? BorderSide(color: widget.buttonColor!.borderColor!, width: 1)
        : null,
    shadowColor: Colors.transparent,
    padding: widget.padding ?? buttonPadding,
    shape: shape,
  );

  Decoration getDecoration() {
    BorderRadius radious = widget.buttonType == AppIconButtonType.circular
        ? BorderRadius.all(Radius.circular(100))
        : BorderRadius.all(Radius.circular(10));
    return BoxDecoration(
      borderRadius: radious,
      gradient: widget.gradient,
      boxShadow: widget.boxShadow,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ({String asset, double size}) icon = widget.icon;

    return Container(
      decoration: getDecoration(),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: buttonStyle,
        child: AppIcon(
          icon.asset,
          height: icon.size,
          width: icon.size,
          color: widget.iconColor,
        ),
      ),
    );
  }
}
