import 'package:flutter/material.dart';

extension SizedBoxExtension on num {
  SizedBox get height => SizedBox(height: toDouble());
  SliverToBoxAdapter get sliverHeight => SliverToBoxAdapter(child: height);
  SizedBox get width => SizedBox(width: toDouble());
  SliverToBoxAdapter get sliverWidth => SliverToBoxAdapter(child: width);
}
