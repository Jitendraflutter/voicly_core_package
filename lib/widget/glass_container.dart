import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 🟢 Added import

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double blur;
  final EdgeInsetsGeometry?
  padding; // 🟢 Made nullable to support dynamic responsive defaults
  final Color? color;
  final Color? borderColor;

  const GlassContainer({
    super.key,
    required this.child,
    this.borderRadius = 24,
    this.blur = 10,
    this.padding, // 🟢 Removed the const default here
    this.color,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          borderRadius.r,
        ), // 🟢 Scaled dynamically
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: blur,
            sigmaY: blur,
          ), // Kept absolute for consistent optical blur
          child: Container(
            padding:
                padding ??
                EdgeInsets.all(16.w), // 🟢 Scaled default padding applied here!
            decoration: BoxDecoration(
              color: color ?? Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(
                borderRadius.r,
              ), // 🟢 Scaled dynamically
              border: Border.all(
                color: borderColor ?? Colors.white.withOpacity(0.25),
                width: 1.2, // Kept absolute for a crisp hairline border
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
