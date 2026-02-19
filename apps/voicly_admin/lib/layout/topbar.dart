import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main_layout.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 1200;

    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor.withOpacity(0.1))),
      ),
      child: Row(
        children: [
          if (isMobile)
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Get.find<LayoutController>().openDrawer(),
            ),
          const Text("Overview", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          const Spacer(),
          // Theme Toggle
          IconButton(
            icon: Icon(Get.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark),
          ),
          const SizedBox(width: 10),
          const VerticalDivider(indent: 20, endIndent: 20),
          const SizedBox(width: 10),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Admin User", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Super Admin", style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          const SizedBox(width: 12),
          const CircleAvatar(radius: 18, child: Icon(Icons.person)),
        ],
      ),
    );
  }
}