import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:flutter_svg/flutter_svg.dart';

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
      child: SvgPicture.asset(
        imagePath,
        height: 60,
      ),
    );
  }
}
