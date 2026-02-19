import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/navigation_controller.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Column(
        children: [
          const DrawerHeader(
            child: Center(
              child: Text(
                "VOICLY ADMIN",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _menuItem(Icons.dashboard_outlined, "Dashboard", 0),
                _menuItem(Icons.people_outline, "Users", 1),
                _menuItem(Icons.headset_mic_outlined, "Callers", 2),
                _menuItem(Icons.call_outlined, "Calls", 3),
                _menuItem(Icons.account_balance_wallet_outlined, "Payments", 4),
                _menuItem(Icons.report_problem_outlined, "Reports", 5),
                _menuItem(Icons.category_outlined, "Categories", 6),
                _menuItem(Icons.content_copy_outlined, "Content", 7),
                _menuItem(
                  Icons.local_offer_outlined,
                  "Offers",
                  8,
                ), // Added Offers
                _menuItem(
                  Icons.security_outlined,
                  "Security",
                  9,
                ), // Security moved to 9
                _menuItem(
                  Icons.settings_outlined,
                  "Settings",
                  10,
                ), // Settings moved to 10
                const Divider(),
                _menuItem(
                  Icons.logout,
                  "Logout",
                  11,
                  color: Colors.red,
                ), // Logout is now 11
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuItem(IconData icon, String title, int index, {Color? color}) {
    final nav = Get.find<NavigationController>();

    return Obx(() {
      final bool isSelected = nav.currentIndex.value == index;
      final Color defaultTextColor = Theme.of(Get.context!).textTheme.bodyMedium?.color ?? Colors.grey;

      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        // Added margin
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.blueAccent.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(
            8,
          ), // Rounded corners for selection
        ),
        child: ListTile(
          dense: true,
          // More compact for Admin panels
          visualDensity: VisualDensity.compact,
          leading: Icon(
            icon,
            size: 20,
            color: isSelected
                ? Colors.blueAccent
                : (color ?? Colors.grey.shade600),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: isSelected ? Colors.blueAccent : (color ?? defaultTextColor),
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          onTap: () {
            if (index == 11) {
              _showLogoutDialog();
            } else {
              nav.changePage(index);
            }
          },
        ),
      );
    });
  }

  void _showLogoutDialog() {
    Get.defaultDialog(
      title: "Logout",
      middleText: "Are you sure you want to end your session?",
      textConfirm: "Logout",
      confirmTextColor: Colors.white,
      onConfirm: () => Get.offAllNamed('/login'), // Redirect to login
    );
  }
}
