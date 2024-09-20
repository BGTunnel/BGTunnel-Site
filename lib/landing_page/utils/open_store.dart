import 'package:flutter/material.dart';
import 'dart:html' as html;

class OpenStore extends StatelessWidget {
  final String imagePath;
  final String url;

  const OpenStore({super.key, required this.imagePath, required this.url});

  void _openUrlInNewTab() {
    html.window.open(url, '_blank');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _openUrlInNewTab,
      child: Image.asset(
        imagePath,
        height: 40,
      ),
    );
  }
}
