import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/button_connect.dart';

class AnimatedColorBackground extends StatefulWidget {
  const AnimatedColorBackground(
      {super.key, required this.primaryColor, required this.secondaryColor});

  final Color primaryColor;
  final Color secondaryColor;

  @override
  State<AnimatedColorBackground> createState() =>
      _AnimatedColorBackgroundState();
}

class _AnimatedColorBackgroundState extends State<AnimatedColorBackground> {
  bool isChanged = false;
  List<Color> primaryColors = const [
    Colors.white,
    Colors.deepPurple,
  ];
  List<Color> secondaryColors = const [
    Colors.blue,
    Colors.white,
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return SizedBox(
        height: height,
        width: double.infinity,
        child: Material(
            child: ConnectButton(
          height: 100,
          width: 100,
          glowingColor: Colors.deepPurple.withOpacity(0.6),
          ringOutsideColor: Colors.deepPurple.withOpacity(0.6),
          colorRing: const [
            Colors.deepPurple,
            Colors.purple,
            Colors.purpleAccent,
            Colors.blueAccent,
          ],
          shadowColor: Colors.deepPurple.withOpacity(0.3),
          containerColor: Colors.deepPurple.withOpacity(0.6),
        )));
  }
}
