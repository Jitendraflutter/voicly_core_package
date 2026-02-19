import 'package:flutter/material.dart';

class SecurityView extends StatelessWidget {
  const SecurityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Security & Control", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 24),

        // Admin Roles Section
        _buildAdminSection(),
        const SizedBox(height: 32),

        // Activity Logs Table
        const Text("System Activity Logs", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _buildLogsTable(context),
      ],
    );
  }

  Widget _buildAdminSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Admin Staff Roles", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ElevatedButton(onPressed: () {}, child: const Text("+ Add Admin")),
              ],
            ),
            const Divider(height: 30),
            _adminTile("Super Admin", "Full Access", "admin@voicly.com"),
            _adminTile("Finance Admin", "Payments Only", "finance@voicly.com"),
            _adminTile("Support Admin", "Reports Only", "support@voicly.com"),
          ],
        ),
      ),
    );
  }

  Widget _adminTile(String role, String access, String email) {
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.admin_panel_settings)),
      title: Text(role),
      subtitle: Text(email),
      trailing: Chip(label: Text(access, style: const TextStyle(fontSize: 11))),
    );
  }

  Widget _buildLogsTable(BuildContext context) {
    return Card(
      child: SizedBox(
        width: double.infinity,
        child: DataTable(
          columns: const [
            DataColumn(label: Text("Timestamp")),
            DataColumn(label: Text("Admin")),
            DataColumn(label: Text("Action")),
            DataColumn(label: Text("IP Address")),
          ],
          rows: List.generate(5, (index) => DataRow(cells: [
            const DataCell(Text("2026-02-18 16:20")),
            const DataCell(Text("Super_Admin")),
            const DataCell(Text("Banned User #102")),
            const DataCell(Text("192.168.1.1")),
          ])),
        ),
      ),
    );
  }
}