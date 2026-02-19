import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Text("Users", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Spacer(),
                SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search name, email, or UID...",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          DataTable(
            columns: const [
              DataColumn(label: Text("Name")),
              DataColumn(label: Text("Wallet")),
              DataColumn(label: Text("Status")),
              DataColumn(label: Text("Actions")),
            ],
            rows: List.generate(5, (index) => DataRow(cells: [
              const DataCell(Text("User Name")),
              const DataCell(Text("\$45.00")),
              DataCell(Chip(label: const Text("Active"), backgroundColor: Colors.green.shade100)),
              DataCell(Row(
                children: [
                  IconButton(icon: const Icon(Icons.edit_outlined, size: 20), onPressed: () {}),
                  IconButton(icon: const Icon(Icons.block, color: Colors.red, size: 20), onPressed: () {}),
                ],
              )),
            ])),
          ),
        ],
      ),
    );
  }
}