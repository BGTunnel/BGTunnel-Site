import 'dart:math';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ConnectButton extends StatefulWidget {
  Color shadowColor = Colors.deepOrange.withOpacity(0.6);
  Color containerColor = Colors.orange.withOpacity(0.6);
  Color ringColor = Colors.deepOrange.withOpacity(0.6);
  Color ringOutsideColor = Colors.deepOrange.withOpacity(0.6);
  Color glowingColor = Colors.deepOrange.withOpacity(0.6);
  final double height;
  final double width;
  Widget iconValue = const Icon(
    Icons.warning,
    color: Colors.orange,
    size: 50,
  );
  List<Color> colorRing = [
    Colors.deepOrange,
    Colors.orange,
    Colors.yellow,
    Colors.deepOrange,
  ];
  ConnectButton(
      {super.key,
      required this.shadowColor,
      required this.containerColor,
      required this.colorRing,
      required this.ringOutsideColor,
      required this.glowingColor,
      required this.height,
      required this.width});
  @override
  _ConnectButtonState createState() => _ConnectButtonState();
}

class _ConnectButtonState extends State<ConnectButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> rippleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    rippleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return GestureDetector(
            child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              painter: RipplePainter(rippleAnimation.value),
              size: Size(widget.width, widget.height),
            ),
            CustomPaint(
              painter: GradientRingPainter(_controller.value, widget.colorRing,
                  widget.ringOutsideColor, widget.glowingColor),
              child: Container(
                width: widget.width,
                height: widget.height,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: widget.shadowColor,
                      spreadRadius: 4,
                      blurRadius: 16,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Center(
                  child: Container(
                    width: widget.width,
                    height: widget.height,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                          color: widget.containerColor,
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
      },
    );
  }
}

class GradientRingPainter extends CustomPainter {
  final double progress;
  Color ringOutsideColor = Colors.deepOrange.withOpacity(0.6);
  Color glowingColor = Colors.deepOrange.withOpacity(0.6);
  List<Color> colorRing = [
    Colors.deepOrange,
    Colors.orange,
    Colors.yellow,
    Colors.deepOrange,
  ];
  GradientRingPainter(
      this.progress, this.colorRing, this.ringOutsideColor, this.glowingColor);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final gradient = SweepGradient(
      startAngle: 0.0,
      endAngle: 2 * pi,
      colors: colorRing,
      stops: [
        progress,
        progress + 0.25,
        progress + 0.5,
        progress + 0.75,
      ],
      transform: GradientRotation(2 * pi * progress),
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15.0;

    final borderPaint3 = Paint()
      ..color = ringOutsideColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final glowingPaint = Paint()
      ..color = glowingColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.0
      ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 20);

    // Drawing the glowing ring
    canvas.drawCircle(size.center(Offset.zero), size.width / 2, glowingPaint);

    // Drawing the main gradient ring
    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);

    canvas.drawCircle(
        size.center(Offset.zero), size.width / 2 + 20, borderPaint3);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RipplePainter extends CustomPainter {
  final double progress;

  RipplePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.deepOrange.withOpacity(1 - progress)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    double radius = (size.width / 2) * progress;

    canvas.drawCircle(size.center(Offset.zero), radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
