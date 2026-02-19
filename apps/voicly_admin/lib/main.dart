import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/theme/app_theme.dart';
import 'layout/main_layout.dart';

void main() {
  runApp(const VoiclyAdminApp());
}

class VoiclyAdminApp extends StatelessWidget {
  const VoiclyAdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Voicly Admin',
      debugShowCheckedModeBanner: false,
      // Theme System
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Switches based on system/toggle
      home: const MainLayout(),
    );
  }
}