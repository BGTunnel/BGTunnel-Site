import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  static const routeName = '/help';

  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: const Center(
        child: Text(
          'Help Page - Topic:',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
