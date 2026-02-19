import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    // We use a SizedBox with a fixed height or a constraint
    // because this view is inside a SingleChildScrollView in MainLayout.
    return DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Fixes the vertical size issue
        children: [
          const Text("App Settings", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: "General Config"),
              Tab(text: "Agora & Voice"),
              Tab(text: "Maintenance & Version"),
            ],
          ),
          const SizedBox(height: 24),
          // FIX: Replaced 'Expanded' with a constrained SizedBox.
          // In an Admin Panel, 600-800px is usually enough for settings tabs.
          SizedBox(
            height: 700,
            child: TabBarView(
              children: [
                _buildGeneralSettings(),
                _buildVoiceSettings(),
                _buildMaintenanceSettings(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ... rest of your _build methods (General, Voice, Maintenance) stay the same
  // Just ensure _buildMaintenanceSettings is also wrapped in a SingleChildScrollView
  // if its content gets too long.

  Widget _buildGeneralSettings() {
    return SingleChildScrollView( // Keeps the inner tab scrollable
      child: Column(
        children: [
          _settingSection("Platform Rules", [
            _inputField("App Name", "Voicly"),
            _inputField("Support Email", "support@voicly.com"),
            _switchField("Allow Guest Browsing", true),
          ]),
          _settingSection("Currency & Billing", [
            _inputField("Currency Symbol", "\$"),
            _inputField("Min. Withdrawal Limit", "50"),
          ]),
        ],
      ),
    );
  }

  Widget _buildVoiceSettings() {
    return SingleChildScrollView(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Agora Configuration", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 20),
              _inputField("Agora App ID", "xxxxxxxxxxxxxx"),
              _inputField("Agora App Certificate", "xxxxxxxxxxxxxx"),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: () {}, child: const Text("Test Agora Connection")),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMaintenanceSettings() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _switchField("Maintenance Mode", false),
          const SizedBox(height: 16),
          _inputField("App Version (Android)", "1.0.4"),
          _inputField("App Version (iOS)", "1.0.2"),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(20)),
              onPressed: () {},
              child: const Text("Save All Settings"),
            ),
          )
        ],
      ),
    );
  }

  // Reusable components (_settingSection, _inputField, _switchField) remain exactly as you have them.
  Widget _settingSection(String title, List<Widget> children) {
    return Card(
      margin: const EdgeInsets.only(bottom: 24),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
            const Divider(),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _inputField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: TextEditingController(text: value),
        decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()),
      ),
    );
  }

  Widget _switchField(String label, bool value) {
    return ListTile(
      title: Text(label),
      trailing: Switch(value: value, onChanged: (v) {}),
    );
  }
}