import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:landify_design_flutter/landing_page/design_systems/colors/colors.dart';

import 'gradient_text.dart';

class LogoShare extends StatelessWidget {
  const LogoShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GradientText(
                'BGTunnel',
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 164, 47, 211),
                    AppColors.kTextColorDark,
                    Theme.of(context).scaffoldBackgroundColor,
                    // Very dark cyan
                  ],
                  stops: [0.0, 0.5, 1.0],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              GestureDetector(
                child: SvgPicture.asset(
                  'assets/share.svg',
                  height: 30,
                  width: 30,
                ),
                onTap: () {
                  HapticFeedback.selectionClick();
                },
              )
            ],
          ),
          const SizedBox(height: 50),
          const Spacer(),
        ],
      ),
    );
  }
}
