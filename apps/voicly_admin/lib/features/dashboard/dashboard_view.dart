import 'package:flutter/material.dart';

import '../../widget/metric_card.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int crossAxisCount = width > 1200 ? 4 : (width > 800 ? 2 : 1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Dashboard Overview", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 24),

        // Metrics Grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 2.2,
          ),
          itemCount: dashboardStats.length,
          itemBuilder: (context, index) => MetricCard(data: dashboardStats[index]),
        ),

        const SizedBox(height: 32),

        // Graph Section
        Container(
          height: 400,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Theme.of(context).dividerColor.withOpacity(0.05)),
          ),
          child: const Center(child: Text("Graph Placeholder (Revenue Growth)")),
        ),
      ],
    );
  }
}

// Dummy Data for Dashboard
final List<Map<String, dynamic>> dashboardStats = [
  {"title": "Total Users", "value": "25,430", "icon": Icons.people, "color": Colors.blue},
  {"title": "Total Callers", "value": "1,204", "icon": Icons.headset_mic, "color": Colors.green},
  {"title": "Total Revenue", "value": "\$12,450", "icon": Icons.account_balance_wallet, "color": Colors.orange},
  {"title": "Call Minutes", "value": "450k", "icon": Icons.timer, "color": Colors.purple},
];