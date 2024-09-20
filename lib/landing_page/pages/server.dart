import 'package:flutter/material.dart';


class ServerListPage extends StatelessWidget {

  const ServerListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: _buildCountryList(),
        ),
        Expanded(
          flex: 1,
          child: _buildInfoSection(),
        ),
      ],
    );
  }

  Widget _buildCountryList() {
    final countries = [
      {'name': 'Japan', 'flag': '🇯🇵'},
      {'name': 'Australia', 'flag': '🇦🇺'},
      {'name': 'Norway', 'flag': '🇳🇴'},
      {'name': 'Russia', 'flag': '🇷🇺'},
      {'name': 'Singapore', 'flag': '🇸🇬'},
      {'name': 'South Korea', 'flag': '🇰🇷'},
      {'name': 'Switzerland', 'flag': '🇨🇭'},
      {'name': 'Turkey', 'flag': '🇹🇷'},
      {'name': 'United Kingdom', 'flag': '🇬🇧'},
      {'name': 'United States', 'flag': '🇺🇸'},
      {'name': 'New Zealand', 'flag': '🇳🇿'},
      {'name': 'Brazil', 'flag': '🇧🇷'},
      {'name': 'Canada', 'flag': '🇨🇦'},
      {'name': 'France', 'flag': '🇫🇷'},
      {'name': 'Germany', 'flag': '🇩🇪'},
      {'name': 'Hong Kong', 'flag': '🇭🇰'},
      {'name': 'India', 'flag': '🇮🇳'},
      {'name': 'Spain', 'flag': '🇪🇸'},
      {'name': 'Italy', 'flag': '🇮🇹'},
      {'name': 'South Africa', 'flag': '🇿🇦'},
      {'name': 'And more', 'flag': '🌎'},
    ];

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: countries.map((country) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(country['flag'] ?? ''),
            const SizedBox(width: 5),
            Text(country['name'] ?? ''),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '6000+',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.teal),
        ),
        const Text(
          'Locations',
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
        const SizedBox(height: 10),
        const Text(
          '50+',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.teal),
        ),
        const Text(
          'Countries',
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
        const SizedBox(height: 10),
        const Text(
          'Unlimited',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.teal),
        ),
        const Text(
          'Data & Bandwidth',
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
        const SizedBox(height: 20),
        // Replace with your custom image or widget
        Container(
          height: 150,
          color: Colors.grey[300],
          child: const Center(child: Text('Illustration Here')),
        ),
      ],
    );
  }
}
