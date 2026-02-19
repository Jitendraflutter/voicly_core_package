import 'package:flutter/material.dart';

class UserDetailsSheet extends StatelessWidget {
  const UserDetailsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      color: Theme.of(context).cardColor,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text("Alice Johnson", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          const Center(child: Text("ID: VOIC-88921", style: TextStyle(color: Colors.grey))),
          const Divider(height: 40),
          _infoTile("Wallet Balance", "\$142.50", Icons.wallet),
          _infoTile("Total Calls", "24 Calls", Icons.call),
          _infoTile("Total Spent", "\$512.00", Icons.payments),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade50, foregroundColor: Colors.red),
              onPressed: () {},
              child: const Text("Ban User Account"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoTile(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.blueAccent),
          const SizedBox(width: 12),
          Text(label),
          const Spacer(),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}