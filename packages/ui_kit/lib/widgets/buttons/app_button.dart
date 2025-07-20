import 'package:flutter/material.dart';
import 'package:ui_kit/themes/button_style.dart';
import 'package:ui_kit/widgets/app_icon.dart';

class AppButton extends StatefulWidget {
  final void Function()? onPressed;
  final ({String icon, Color? color})? icon;
  final String label;
  final AppButtonType type;
  final ButtonStyle? buttonStyle;
  final double? width;
  final MainAxisAlignment? alignment;
  const AppButton.primary({
    super.key,
    required this.label,
    this.buttonStyle,
    required this.onPressed,
    this.width,
    this.icon,
    this.alignment,
  }) : type = AppButtonType.primary;
  const AppButton.primaryLight({
    super.key,
    required this.label,
    this.buttonStyle,
    this.onPressed,
    this.width,
    this.icon,
    this.alignment,
  }) : type = AppButtonType.primaryLight;

  const AppButton.text({
    super.key,
    required this.label,
    this.buttonStyle,
    this.onPressed,
    this.width,
    this.icon,
    this.alignment,
  }) : type = AppButtonType.text;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = AppButtonStyle.getStyle(context, widget.type)
        .copyWith(
          alignment: widget.buttonStyle?.alignment,
          padding: widget.buttonStyle?.padding,
          minimumSize: widget.buttonStyle?.minimumSize,
          maximumSize: widget.buttonStyle?.maximumSize,
          tapTargetSize: widget.buttonStyle?.tapTargetSize,
          mouseCursor: widget.buttonStyle?.mouseCursor,
          visualDensity: widget.buttonStyle?.visualDensity,
          elevation: widget.buttonStyle?.elevation,
          shadowColor: widget.buttonStyle?.shadowColor,
          surfaceTintColor: widget.buttonStyle?.surfaceTintColor,
          overlayColor: widget.buttonStyle?.overlayColor,
          shape: widget.buttonStyle?.shape,
          foregroundColor: widget.buttonStyle?.foregroundColor,
          splashFactory: widget.buttonStyle?.splashFactory,
          enableFeedback: widget.buttonStyle?.enableFeedback,
          backgroundBuilder: widget.buttonStyle?.backgroundBuilder,
          fixedSize: widget.buttonStyle?.fixedSize,
          foregroundBuilder: widget.buttonStyle?.foregroundBuilder,
          side: widget.buttonStyle?.side,
          animationDuration: widget.buttonStyle?.animationDuration,
          textStyle: widget.buttonStyle?.textStyle,
          backgroundColor: widget.buttonStyle?.backgroundColor,
          iconColor: widget.buttonStyle?.iconColor,
          iconSize: widget.buttonStyle?.iconSize,
          iconAlignment: widget.buttonStyle?.iconAlignment,
        );
    final child = Row(
      mainAxisAlignment: widget.alignment ?? MainAxisAlignment.center,

      children: [
        if (widget.icon != null)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: AppIcon(
              widget.icon!.icon,
              width: 24,
              height: 24,
              color: widget.icon?.color,
            ),
          ),
        Text(widget.label, style: buttonStyle.textStyle?.resolve({})),
      ],
    );

    final button = switch (widget.type) {
      AppButtonType.text => TextButton(
        onPressed: widget.onPressed,
        style: buttonStyle,
        child: child,
      ),
      _ => ElevatedButton(
        onPressed: widget.onPressed,
        style: buttonStyle,
        child: child,
      ),
    };

    return SizedBox(width: widget.width, child: button);
  }
}
