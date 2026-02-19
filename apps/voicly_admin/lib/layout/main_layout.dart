import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/navigation_controller.dart';
import 'sidebar.dart';
import 'topbar.dart';
import '../features/dashboard/dashboard_view.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    // Screen width check
    bool isDesktop = MediaQuery.of(context).size.width > 1200;
    final nav = Get.put(NavigationController());

    return Scaffold(
      key: Get.put(
        LayoutController(),
      ).scaffoldKey, // For opening drawer via GetX
      drawer: isDesktop ? null : const Sidebar(),
      body: Row(
        children: [
          if (isDesktop) const SizedBox(width: 260, child: Sidebar()),
          Expanded(
            child: Column(
              children: [
                const TopBar(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Obx(() => nav.screens[nav.currentIndex.value]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LayoutController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  void openDrawer() => scaffoldKey.currentState?.openDrawer();
}
