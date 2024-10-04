import 'package:flutter/material.dart';
import 'dart:math';

class RandomShape extends StatelessWidget {
  final double width;
  final double height;
  final double top;
  final double left;
  final ShapeType shapeType;
  final List<Color> colors; // Color list as a parameter

  RandomShape({
    Key? key,
    required this.width,
    required this.height,
    required this.top,
    required this.left,
    required this.shapeType,
    required this.colors, // Constructor requires a color list
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Randomly select a color from the list
    final Color randomColor = colors[Random().nextInt(colors.length)];

    return Positioned(
      top: top,
      left: left,
      child: shapeType == ShapeType.circle
          ? Container(
              width: width,
              height: width, // width is equal to height for circles
              decoration: BoxDecoration(
                color:
                    randomColor.withOpacity(0.5), // Random color with opacity
                shape: BoxShape.circle,
              ),
            )
          : Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color:
                    randomColor.withOpacity(0.5), // Random color with opacity
                shape: BoxShape.rectangle,
              ),
            ),
    );
  }
}

enum ShapeType { circle, rectangle }

class RandomShapesBackground extends StatelessWidget {
  final int numberOfShapes;
  final List<Color> colors; // Color list as a property

  const RandomShapesBackground({
    Key? key,
    required this.numberOfShapes,
    this.colors = const [
      // Default color list
      Colors.purple,
      Colors.blue,
      Colors.red,
      Colors.purpleAccent,
      Colors.lightBlue,
      Colors.deepOrange,
      Colors.deepPurple,
    ],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final random = Random();

    List<Widget> shapes = List.generate(numberOfShapes, (index) {
      double width =
          random.nextDouble() * 100 + 20; // Random width between 20-120
      double height =
          random.nextDouble() * 100 + 20; // Random height between 20-120
      double top = random.nextDouble() * MediaQuery.of(context).size.height;
      double left = random.nextDouble() * MediaQuery.of(context).size.width;
      ShapeType shapeType =
          random.nextBool() ? ShapeType.circle : ShapeType.rectangle;

      return RandomShape(
        width: width,
        height: height,
        top: top,
        left: left,
        shapeType: shapeType,
        colors: colors, // Pass the color list to RandomShape
      );
    });

    return Stack(
      children: shapes,
    );
  }
}
