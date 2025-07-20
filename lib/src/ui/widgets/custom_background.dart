import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({
    super.key,
    required this.child,
    this.positionedChildren,
    this.color = Colors.white,
  });

  final Widget child;
  final List<Widget>? positionedChildren;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          child: child,
        ),
        if (positionedChildren != null) ...positionedChildren!,
      ],
    );
  }
}
