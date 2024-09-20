// import 'package:animate_gradient/animate_gradient.dart';
// import 'package:flutter/material.dart';

// class AnimatedColorBackground extends StatefulWidget {
//   const AnimatedColorBackground(
//       {super.key, required this.primaryColor, required this.secondaryColor});

//   final Color primaryColor;
//   final Color secondaryColor;

//   @override
//   State<AnimatedColorBackground> createState() =>
//       _AnimatedColorBackgroundState();
// }

// class _AnimatedColorBackgroundState extends State<AnimatedColorBackground> {
//   bool isChanged = false;
//   List<Color> primaryColors = const [
//     Colors.white,
//     Colors.deepPurple,
//   ];
//   List<Color> secondaryColors = const [
//     Colors.blue,
//     Colors.white,
//   ];
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.sizeOf(context).height;
//     return SizedBox(
//         height: height,
//         width: double.infinity,
//         child: AnimateGradient(
//           primaryBeginGeometry: const AlignmentDirectional(0, 1),
//           primaryEndGeometry: const AlignmentDirectional(0, 2),
//           secondaryBeginGeometry: const AlignmentDirectional(2, 0),
//           secondaryEndGeometry: const AlignmentDirectional(0, -0.8),
//           textDirectionForGeometry: TextDirection.rtl,
//           primaryColors: primaryColors,
//           secondaryColors: secondaryColors,
//         ));
//   }
// }
import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';
import 'package:metaballs/metaballs.dart';

class ColorsEffectPair {
  final List<Color> colors;
  final MetaballsEffect? effect;
  final String name;

  ColorsEffectPair({
    required this.colors,
    required this.name,
    required this.effect,
  });
}

List<ColorsEffectPair> colorsAndEffects = [
  ColorsEffectPair(colors: [
    const Color.fromARGB(255, 0, 255, 106),
    const Color.fromARGB(255, 255, 251, 0),
  ], effect: MetaballsEffect.grow(), name: 'GROW'),
];

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
            child: Container(
                decoration: const BoxDecoration(
                    gradient: RadialGradient(
                        center: Alignment.bottomCenter,
                        radius: 1.5,
                        colors: [
                      Color.fromARGB(255, 255, 255, 255),
                      Color.fromARGB(255, 250, 233, 255),
                    ])),
                child: Metaballs(
                  effect: MetaballsEffect.follow(),
                  glowRadius: 1,
                  glowIntensity: 0.6,
                  maxBallRadius: 50,
                  minBallRadius: 20,
                  metaballs: 30,
                  color: Colors.grey,
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 157, 0, 255),
                    Color.fromARGB(255, 0, 255, 251),
                  ], begin: Alignment.bottomRight, end: Alignment.topLeft),
                ))));
  }
}
