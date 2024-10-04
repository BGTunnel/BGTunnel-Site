import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              Row(
                children: [
                  Text(
                    'BGTunnel',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
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
