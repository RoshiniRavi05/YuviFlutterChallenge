import 'package:flutter/material.dart';

/// Flexed Bicep Icon loaded directly from the exact reference image provided by the user.
class BicepIcon extends StatelessWidget {
  final double size;

  const BicepIcon({
    super.key,
    this.size = 44.0,
    Color? color,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        'assets/images/bicep_icon.png',
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
