import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GradientBorderIcon extends StatelessWidget {
  final String assetPath; // Path to the SVG asset
  final List<Color> gradientColors; // Gradient colors for the border
  final double borderRadius; // Radius for the border
  final double strokeWidth; // Width of the border
  final double padding; // Padding inside the border

  const GradientBorderIcon({
    super.key,
    required this.assetPath,
    required this.gradientColors,
    this.borderRadius = 5.0,
    this.strokeWidth = 2.0,
    this.padding = 4.0,
    required String asset,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GradientBorderPainter(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        strokeWidth: strokeWidth,
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Center(
          child: SvgPicture.asset(assetPath),
        ),
      ),
    );
  }
}

// GradientBorderPainter to draw the gradient border
class GradientBorderPainter extends CustomPainter {
  final BorderRadiusGeometry borderRadius;
  final Gradient gradient;
  final double strokeWidth;

  GradientBorderPainter({
    required this.borderRadius,
    required this.gradient,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader =
          gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Radius.circular(borderRadius
            .resolve(TextDirection.ltr)
            .topLeft
            .x), // Using radius from the borderRadius
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant GradientBorderPainter oldDelegate) {
    return true; // Repaint when the parameters change
  }
}
