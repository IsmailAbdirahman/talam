import 'package:flutter/material.dart';

class BackgroundIconColor extends StatelessWidget {
  final Widget widget;
  const BackgroundIconColor({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41,
      width: 41,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white24),
      child: widget,
    );
  }
}
