import 'package:flutter/material.dart';

class ReportsView extends StatelessWidget {
  const ReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Complaints & Reports", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        DefaultTabController(
          length: 2,
          child: Column(
            children: [
              const TabBar(
                tabs: [Tab(text: "User vs Caller"), Tab(text: "Caller vs User")],
                isScrollable: true,
              ),
              SizedBox(
                height: 600,
                child: TabBarView(
                  children: [
                    _buildReportList("User reported Caller"),
                    _buildReportList("Caller reported User"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildReportList(String type) {
    return ListView.builder(
      itemCount: 4,
      padding: const EdgeInsets.only(top: 16),
      itemBuilder: (context, index) => Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: ListTile(
          leading: const Icon(Icons.report_problem, color: Colors.redAccent),
          title: Text("Issue #102$index - Harassment Claim"),
          subtitle: Text("Reported by ID: 9921 • $type"),
          trailing: ElevatedButton(
            onPressed: () => _showReportDetails(context),
            child: const Text("Review"),
          ),
        ),
      ),
    );
  }

  void _showReportDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Report Details"),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Description:", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("The caller was using inappropriate language during the session."),
            SizedBox(height: 16),
            Text("System Action:", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Chat logs are attached below for review."),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Dismiss")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {},
            child: const Text("Block Both Sides"),
          ),
        ],
      ),
    );
  }
}