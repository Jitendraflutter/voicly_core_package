import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:voicly_admin/features/content/content_view.dart';
import 'package:voicly_admin/features/offers/offers_view.dart';
import 'package:voicly_admin/features/security/security_view.dart';
import 'package:voicly_admin/features/users/user_view.dart';
// Import all your views here
import '../features/categories/category_view.dart';
import '../features/dashboard/dashboard_view.dart';
import '../features/callers/caller_view.dart';
import '../features/calls/call_view.dart';
import '../features/payments/payment_view.dart';
import '../features/reports/reports_view.dart';
import '../features/setting/setting_view.dart';

class NavigationController extends GetxController {
  // 0 is Dashboard, 1 is Users, 2 is Callers, etc.
  var currentIndex = 0.obs;

  final List<Widget> screens = [
    DashboardView(),
    const UserView(),
    const CallerView(),
    const CallView(),
    const PaymentView(),
    const ReportsView(),
    const CategoryView(),
    const ContentView(),
    const OffersView(),
    const SecurityView(),
    const SettingsView(),
  ];

  void changePage(int index) {
    currentIndex.value = index;
    // Close drawer on mobile after selection
    if (Get.width < 1200) {
      Get.back();
    }
  }
}
