import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallerView extends StatelessWidget {
  const CallerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Caller Management",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        _buildStatsRow(),
        const SizedBox(height: 24),
        Card(
          child: Column(
            children: [
              _buildTableActions(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 40,
                  columns: const [
                    DataColumn(label: Text("Name")),
                    DataColumn(label: Text("Category")),
                    DataColumn(label: Text("Rate/Min")),
                    DataColumn(label: Text("Rating")),
                    DataColumn(label: Text("KYC Status")),
                    DataColumn(label: Text("Actions")),
                  ],
                  rows: List.generate(8, (index) => _buildCallerRow(index)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: [
        _miniStat("Active Callers", "840", Colors.green),
        const SizedBox(width: 16),
        _miniStat("Pending KYC", "12", Colors.orange),
        const SizedBox(width: 16),
        _miniStat("Top Rated", "156", Colors.blue),
      ],
    );
  }

  Widget _miniStat(String label, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(color: color, fontWeight: FontWeight.w600),
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  DataRow _buildCallerRow(int index) {
    bool isPending = index == 0; // Just for UI variety
    return DataRow(
      cells: [
        const DataCell(Text("Expert John")),
        const DataCell(Text("Astrology")),
        const DataCell(Text("\$0.50")),
        const DataCell(
          Row(
            children: [
              Icon(Icons.star, size: 16, color: Colors.amber),
              Text(" 4.9"),
            ],
          ),
        ),
        DataCell(
          Chip(
            label: Text(
              isPending ? "Pending" : "Verified",
              style: const TextStyle(fontSize: 12),
            ),
            backgroundColor: isPending
                ? Colors.orange.shade50
                : Colors.green.shade50,
          ),
        ),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove_red_eye_outlined, size: 20),
                onPressed: () => _showKYCPreview(),
                tooltip: "View KYC Documents",
              ),
              IconButton(
                icon: const Icon(
                  Icons.verified_user_outlined,
                  color: Colors.blue,
                  size: 20,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  // --- REUSABLE UI DIALOG FOR KYC ---
  void _showKYCPreview() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          width: 500,
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "KYC Verification",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  CloseButton(),
                ],
              ),
              const Divider(height: 32),
              const ListTile(
                leading: Icon(Icons.badge_outlined),
                title: Text("Government ID (Front)"),
                subtitle: Text("Uploaded: 12 Oct 2025"),
              ),
              // Dummy Image Preview
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.image, size: 50, color: Colors.grey),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      child: const Text(
                        "Reject Application",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Get.back(),
                      child: const Text("Approve Caller"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTableActions() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const Text(
            "Registered Callers",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text("Add New Category"),
          ),
        ],
      ),
    );
  }
}
