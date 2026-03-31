import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 🟢 Added import

class VoiclyAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isOnline;
  final double radius;
  final bool showStatus;
  final void Function()? onTap;
  final double borderWidth;

  const VoiclyAvatar({
    super.key,
    required this.imageUrl,
    this.isOnline = false,
    this.radius = 40,
    this.showStatus = true,
    this.onTap,
    this.borderWidth = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        // 🟢 Scaled the ripple effect radius to match the visual size
        radius: radius.r + borderWidth,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // 🔥 Gradient border avatar
            Container(
              padding: EdgeInsets.all(
                borderWidth,
              ), // Kept absolute for a crisp border
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.primaryButtonGradient,
              ),
              child: CircleAvatar(
                radius: radius.r, // 🟢 Scaled dynamically
                backgroundColor: AppColors.primaryPeachShade,
                backgroundImage: CachedNetworkImageProvider(imageUrl),
              ),
            ),

            // 🟢 Online/offline status
            if (showStatus)
              Positioned(
                right: 2.w, // 🟢 Scaled
                bottom: 2.h, // 🟢 Scaled
                child: Container(
                  width: (radius * 0.35)
                      .r, // 🟢 Scaled proportionately to the main radius
                  height: (radius * 0.35).r,
                  decoration: BoxDecoration(
                    color: isOnline ? AppColors.success : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
