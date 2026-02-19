import 'package:flutter/material.dart';

class ContentView extends StatelessWidget {
  const ContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Content Management", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),

        // Banner Management Section
        _buildSectionHeader("Home Banners", () {}),
        const SizedBox(height: 12),
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) => _bannerCard(index),
          ),
        ),

        const SizedBox(height: 32),

        // FAQ & Announcements
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _contentListCard("App Announcements", Icons.campaign)),
            const SizedBox(width: 20),
            Expanded(child: _contentListCard("FAQ Editor", Icons.quiz)),
          ],
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, VoidCallback onAdd) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        TextButton.icon(onPressed: onAdd, icon: const Icon(Icons.add), label: const Text("Upload New")),
      ],
    );
  }

  Widget _bannerCard(int index) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: NetworkImage('https://via.placeholder.com/300x150'), // Placeholder
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 8, right: 8,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(icon: const Icon(Icons.delete, color: Colors.red, size: 20), onPressed: () {}),
            ),
          ),
        ],
      ),
    );
  }

  Widget _contentListCard(String title, IconData icon) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: Icon(icon, color: Colors.blueAccent),
              title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 14),
            ),
            const Divider(),
            _quickListTile("New Year Promo..."),
            _quickListTile("System Maintenance..."),
            TextButton(onPressed: () {}, child: const Text("View All"))
          ],
        ),
      ),
    );
  }

  Widget _quickListTile(String text) {
    return ListTile(
      dense: true,
      title: Text(text, style: const TextStyle(fontSize: 13)),
      trailing: const Icon(Icons.edit, size: 16),
    );
  }
}