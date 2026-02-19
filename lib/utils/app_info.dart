import 'package:core/constants/app_colors.dart';
import 'package:core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class AppInfo extends StatelessWidget {
  final bool showVersion;
  final bool isVisible;

  const AppInfo({super.key, this.showVersion = true, this.isVisible = true});

  @override
  Widget build(BuildContext context) {
    if (!isVisible) return const SizedBox.shrink();

    return  Material(
      color: Colors.transparent,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${AppStrings.voiclyCaller} ${AppStrings.appVersion}",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.darkGrey,
                fontSize: 12,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
