import 'package:flutter/material.dart';

class CallView extends StatelessWidget {
  const CallView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Call Management", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 24),

        // Live Monitoring Section
        const Text("Live Calls (Ongoing)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.green)),
        const SizedBox(height: 12),
        _buildLiveCallsGrid(),

        const SizedBox(height: 32),

        // Call Logs Table
        const Text("Call Logs", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _buildCallLogsTable(context),
      ],
    );
  }

  Widget _buildLiveCallsGrid() {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) => _liveCallCard(),
      ),
    );
  }

  Widget _liveCallCard() {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("04:22", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
              Icon(Icons.graphic_eq, size: 16, color: Colors.green.shade700),
            ],
          ),
          const Spacer(),
          const Row(
            children: [
              CircleAvatar(radius: 12, child: Text("U", style: TextStyle(fontSize: 10))),
              SizedBox(width: 8),
              Text("User_99"),
              Spacer(),
              Icon(Icons.swap_horiz, size: 16, color: Colors.grey),
              Spacer(),
              Text("Caller_X"),
              SizedBox(width: 8),
              CircleAvatar(radius: 12, backgroundColor: Colors.orange, child: Text("C", style: TextStyle(fontSize: 10))),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCallLogsTable(BuildContext context) {
    return Card(
      child: DataTable(
        headingRowColor: WidgetStateProperty.all(Theme.of(context).dividerColor.withOpacity(0.05)),
        columns: const [
          DataColumn(label: Text("Date & Time")),
          DataColumn(label: Text("Caller ID")),
          DataColumn(label: Text("Duration")),
          DataColumn(label: Text("Charged")),
          DataColumn(label: Text("Status")),
          DataColumn(label: Text("Actions")),
        ],
        rows: List.generate(5, (index) => DataRow(cells: [
          const DataCell(Text("Feb 18, 2026 14:30")),
          const DataCell(Text("EXPERT_RAVI")),
          const DataCell(Text("12m 40s")),
          const DataCell(Text("\$6.33")),
          DataCell(Chip(
            label: Text(index % 2 == 0 ? "Completed" : "Cancelled", style: const TextStyle(fontSize: 11)),
            backgroundColor: index % 2 == 0 ? Colors.green.shade50 : Colors.red.shade50,
          )),
          DataCell(TextButton(onPressed: () {}, child: const Text("Refund"))),
        ])),
      ),
    );
  }
}