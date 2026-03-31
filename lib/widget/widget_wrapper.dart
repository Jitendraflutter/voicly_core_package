import 'package:core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetWrapper extends StatelessWidget {
  final Widget child;

  const WidgetWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(22.r),
        topRight: Radius.circular(22.r),
      ),
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: AppColors.mainScreenBackground,
            ),
          ),

          Container(
            decoration: const BoxDecoration(gradient: AppColors.topLeftGlow),
          ),

          Container(
            decoration: const BoxDecoration(gradient: AppColors.topRightGlow),
          ),

          child,
        ],
      ),
    );
  }
}
