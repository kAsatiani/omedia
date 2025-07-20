import 'package:flutter/material.dart';
import 'package:ui_kit/themes/app_colors.dart';

enum CustomListTileType { listTile, radio, info }

class CustomListTile<T> extends StatefulWidget {
  const CustomListTile.listTile({
    super.key,
    this.leading,
    this.title,
    this.subTitle,
    this.trailing,
    this.onPressed,
    this.backgroundColor = AppColors.grayVeryLight,
    this.elevation,
  }) : type = CustomListTileType.listTile,
       value = null as T,
       groupValue = null,
       onChanged = null;

  const CustomListTile.info({
    super.key,
    this.leading,
    this.title,
    this.subTitle,
    this.trailing,
    this.onPressed,
    this.backgroundColor = AppColors.grayVeryLight,
    this.elevation,
  }) : type = CustomListTileType.info,
       value = null as T,
       groupValue = null,
       onChanged = null;

  const CustomListTile.radio({
    super.key,
    this.title,
    this.subTitle,
    this.trailing,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.backgroundColor = AppColors.grayVeryLight,
    this.elevation,
  }) : type = CustomListTileType.radio,
       leading = null,
       onPressed = null;

  final CustomListTileType type;
  final Widget? leading;
  final Widget? title;
  final Widget? subTitle;
  final Widget? trailing;
  final double? elevation;
  final Color backgroundColor;
  final T value;
  final T? groupValue;
  final void Function(T?)? onChanged;
  final void Function()? onPressed;

  @override
  State<CustomListTile<T>> createState() => _CustomListTileState<T>();
}

class _CustomListTileState<T> extends State<CustomListTile<T>> {
  BorderRadius _getBorderRadius() {
    switch (widget.type) {
      case CustomListTileType.info:
        return const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
          topLeft: Radius.zero,
          topRight: Radius.zero,
        );
      default:
        return BorderRadius.circular(12);
    }
  }

  Widget _buildTileContent() {
    switch (widget.type) {
      case CustomListTileType.radio:
        return _buildRadioContent();
      default:
        return _buildDefaultContent();
    }
  }

  Widget _buildDefaultContent() {
    return Row(
      children: [
        if (widget.leading != null) ...[
          widget.leading!,
          const SizedBox(width: 10),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.title != null) widget.title!,
              if (widget.subTitle != null) ...[
                const SizedBox(height: 4),
                widget.subTitle!,
              ],
            ],
          ),
        ),
        if (widget.trailing != null) ...[
          const SizedBox(width: 10),
          widget.trailing!,
        ],
      ],
    );
  }

  Widget _buildRadioContent() {
    return Row(
      children: [
        Radio<T>(
          value: widget.value,
          groupValue: widget.groupValue,
          onChanged: widget.onChanged,
          fillColor: WidgetStateProperty.all(AppColors.primary),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.title != null) widget.title!,
              if (widget.subTitle != null) ...[
                const SizedBox(height: 4),
                widget.subTitle!,
              ],
            ],
          ),
        ),
        if (widget.trailing != null) ...[
          const SizedBox(width: 8),
          widget.trailing!,
        ],
      ],
    );
  }

  void _handleTap() {
    if (widget.type == CustomListTileType.radio) {
      widget.onChanged?.call(widget.value);
    } else {
      widget.onPressed?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = _getBorderRadius();

    return Card(
      color: widget.backgroundColor,
      elevation:
          widget.elevation ??
          ((widget.type == CustomListTileType.info) ? 0 : 1),
      child: Material(
        color: Colors.transparent,
        borderRadius: borderRadius,
        child: InkWell(
          onTap: (widget.onPressed != null || widget.onChanged != null)
              ? _handleTap
              : null,
          borderRadius: borderRadius,
          child: Container(
            padding: const EdgeInsets.all(12),
            child: _buildTileContent(),
          ),
        ),
      ),
    );
  }
}
