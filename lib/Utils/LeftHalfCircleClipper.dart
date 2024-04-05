import 'package:flutter/material.dart';

class LeftHalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0); // Move to top-right corner
    path.lineTo(size.width, size.height / 2); // Move to half height of right side
    path.arcToPoint(
      Offset(size.width, size.height / 2),
      radius: Radius.circular(size.height / 2),
      clockwise: true,
    );
    path.lineTo(size.width, size.height); // Move to bottom-right corner
    path.lineTo(0.0, size.height); // Move to bottom-left corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}