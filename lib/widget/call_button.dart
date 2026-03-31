import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 🟢 Added import

class CallButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  const CallButton({
    super.key,
    required this.icon,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onTap, // 🟢 Cleaner than onTap ?? null
        child: Container(
          padding: EdgeInsets.all(10.w), // 🟢 Scaled symmetrically
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.3),
            shape: BoxShape.circle,
            border: Border.all(
              color: color.withOpacity(0.2),
              width: 0.5, // Kept absolute for a crisp hairline border
            ),
          ),
          child: Icon(
            icon,
            color: color,
            size: 22.sp, // 🟢 Scaled based on font-size accessibility
          ),
        ),
      ),
    );
  }
}
