import 'package:flutter/material.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Financial Management", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),

          // Settings Row
          _buildQuickSettings(),

          const SizedBox(height: 32),

          // Payout Requests
          const Text("Pending Payouts (Callers)", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildPayoutTable(),
        ],
      ),
    );
  }

  Widget _buildQuickSettings() {
    return Row(
      children: [
        _settingCard("Voicly Commission", "20%", Icons.percent, Colors.orange),
        const SizedBox(width: 16),
        _settingCard("Min. Payout", "\$50.00", Icons.monetization_on, Colors.blue),
      ],
    );
  }

  Widget _settingCard(String label, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            CircleAvatar(backgroundColor: color, foregroundColor: Colors.white, child: Icon(icon)),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(color: Colors.black54)),
                Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const Spacer(),
            TextButton(onPressed: () {}, child: const Text("Edit")),
          ],
        ),
      ),
    );
  }

  Widget _buildPayoutTable() {
    return Card(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) => ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: const Text("Caller #2241 (Astrology)"),
          subtitle: const Text("Requested: \$145.00"),
          trailing: ElevatedButton(
            onPressed: () {},
            child: const Text("Release Payment"),
          ),
        ),
      ),
    );
  }
}