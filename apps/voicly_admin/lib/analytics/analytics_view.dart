import 'package:flutter/material.dart';

class AnalyticsGeneratorView extends StatelessWidget {
  const AnalyticsGeneratorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Reports & Export", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(child: _reportTypeCard("Financial Report", "Revenue, Payouts, Commissions", Icons.account_balance)),
            const SizedBox(width: 16),
            Expanded(child: _reportTypeCard("Call Analytics", "Duration, Success Rate, Ratings", Icons.call_made)),
            const SizedBox(width: 16),
            Expanded(child: _reportTypeCard("User Growth", "Signups, Retention, Activity", Icons.trending_up)),
          ],
        ),
        const SizedBox(height: 32),
        _buildExportCustomizer(context),
      ],
    );
  }

  Widget _reportTypeCard(String title, String desc, IconData icon) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.blueAccent, size: 30),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(desc, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildExportCustomizer(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Export Custom Report", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Date Range",
                      prefixIcon: const Icon(Icons.calendar_today),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "File Format",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    items: const [
                      DropdownMenuItem(value: "pdf", child: Text("PDF Document")),
                      DropdownMenuItem(value: "csv", child: Text("Excel/CSV")),
                    ],
                    onChanged: (v) {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.download),
                label: const Text("Generate Report"),
              ),
            )
          ],
        ),
      ),
    );
  }
}