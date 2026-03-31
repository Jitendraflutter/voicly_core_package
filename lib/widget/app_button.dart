import 'package:core/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 🟢 Added import

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool iconRight;
  final double? width;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.iconRight = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: Container(
          width: width ?? double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: 15.h, // 🟢 Scaled
            horizontal: 20.w, // 🟢 Scaled
          ),
          decoration: BoxDecoration(
            gradient: AppColors.primaryButtonGradient,
            borderRadius: BorderRadius.circular(20.r), // 🟢 Scaled
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryPurple.withOpacity(0.3),
                blurRadius: 15.r, // 🟢 Scaled
                offset: Offset(0, 8.h), // 🟢 Scaled
              ),
            ],
          ),
          child: Center(
            child: icon == null
                ? Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp, // 🟢 Scaled
                      fontWeight: FontWeight.normal,
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: iconRight
                        ? [
                            Text(
                              text,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp, // 🟢 Scaled
                              ),
                            ),
                            SizedBox(width: 8.w), // 🟢 Scaled
                            Icon(
                              icon,
                              color: Colors.white,
                              size: 20.sp,
                            ), // 🟢 Scaled
                          ]
                        : [
                            Icon(
                              icon,
                              color: Colors.white,
                              size: 20.sp,
                            ), // 🟢 Scaled
                            SizedBox(width: 8.w), // 🟢 Scaled
                            Text(
                              text,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp, // 🟢 Scaled
                              ),
                            ),
                          ],
                  ),
          ),
        ),
      ),
    );
  }
}
