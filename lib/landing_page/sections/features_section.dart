import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/gradient_text.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/label_with_description.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/max_container.dart';
import 'package:landify_design_flutter/landing_page/design_systems/typography/text_styles.dart';
import 'package:landify_design_flutter/landing_page/design_systems/colors/colors.dart';
import 'package:landify_design_flutter/landing_page/shared/custom_appbar.dart';
import 'package:landify_design_flutter/landing_page/shared/random_shape.dart';
import 'package:landify_design_flutter/landing_page/utils/breakpoint.dart';

import '../utils/connection_provider.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    int featuresLength = 6;
    int columnSizes = 1;
    int rowSizes = featuresLength;

    if (breakpoint.equals(Breakpoint.desktop)) {
      columnSizes = 3;
      rowSizes = featuresLength ~/ columnSizes;
    } else if (breakpoint.largerThanLaptop) {
      columnSizes = 2;
      rowSizes = featuresLength ~/ columnSizes;
    }

    return MaxContainer(
        padding: Responsive.isDesktop(context)
            ? const EdgeInsets.symmetric(horizontal: 50, vertical: 20)
            : const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        border: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1), // Glass effect
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.3)),
            boxShadow: [
              BoxShadow(
                color: Colors.blueAccent.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: Responsive.isDesktop(context)
                ? const EdgeInsets.symmetric(vertical: 96, horizontal: 50)
                : const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            child: Column(
              children: [
                LayoutBuilder(
                  builder: (context, constraint) {
                    final fullWidth = constraint.biggest.width;
                    final halfWidth = fullWidth / 1.5;

                    final width = breakpoint.largerOrEqualToLaptop
                        ? halfWidth
                        : fullWidth;

                    return Container(
                      width: width,
                      padding: Responsive.isDesktop(context)
                          ? const EdgeInsets.all(16)
                          : const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(bottom: 64),
                      child: const LabelWithDescription(
                        labelWithDescriptionAlign:
                            LabelWithDescriptionAlign.center,
                        title: "Features you'll love",
                        subtitle:
                            'BGTunnel is perfect for users seeking exceptional privacy, bypassing censorship, and customizing their VPN experience.',
                      ),
                    );
                  },
                ),
                LayoutGrid(
                  rowSizes: List.generate(rowSizes, (_) => auto),
                  columnSizes: List.generate(columnSizes, (_) => auto),
                  rowGap: 64,
                  children: [
                    _FeatureItem(
                      title: ' V2Ray Integration',
                      description:
                          'Harness the power of V2Ray with BGTunnel state-of-the-art VPN technology. Enjoy robust security and turbo-speed performance.',
                      icon: Image.asset('assets/folder.png', height: 50),
                    ),
                    _FeatureItem(
                      title: 'User-Friendly ',
                      description:
                          'Experience effortless navigation with BGTunnel sleek and intuitive design. Connect to your V2Ray server, adjust settings, and manage your VPN.',
                      icon: Image.asset('assets/man.png', height: 50),
                    ),
                    _FeatureItem(
                      title: 'Protocol Support',
                      description:
                          'Choose from a range of protocols including VMess, Trojan, and Shadowsocks. BGTunnel comprehensive protocol support ensures you get the most secure.',
                      icon: Image.asset('assets/server.png', height: 50),
                    ),
                    _FeatureItem(
                        title: 'Real-Time Monitoring',
                        description:
                            'Stay informed with real-time updates on your connection status and data usage. BGTunnel provides transparency and control.',
                        icon: Image.asset('assets/mobile-analytics.png',
                            height: 50)),
                    _FeatureItem(
                      title: 'Privacy Protection',
                      description:
                          'Safeguard your online activities with advanced encryption. BGTunnel ensures your personal information remains private and secure.',
                      icon: Image.asset('assets/shield.png', height: 50),
                    ),
                    _FeatureItem(
                      title: 'Effortless Setup',
                      description:
                          'Get started quickly with BGTunnel’s streamlined configuration. Connect to your custom V2Ray VPN server with ease and efficiency.',
                      icon: Image.asset('assets/gear.png', height: 50),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class _FeatureItem extends ConsumerWidget {
  const _FeatureItem({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;

  final String description;

  final Widget icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isConnected = ref.watch(connectionProvider);
    return Stack(
      children: [
        RandomShapesBackground(
          numberOfShapes: 10,
          colors: isConnected
              ? [
                  const Color.fromARGB(
                      255, 170, 52, 255), // Dark Purple (Indigo)
                  const Color.fromARGB(
                      255, 60, 248, 255), // Dark Purple (Purple)
                  const Color.fromARGB(255, 164, 255, 128),
                ]
              : [
                  const Color.fromARGB(
                      255, 255, 105, 105), // Dark Purple (Indigo)
                  const Color.fromARGB(
                      255, 236, 255, 25), // Dark Purple (Purple)
                  const Color.fromARGB(255, 231, 255, 97),
                ],
        ),
        Padding(
            padding: Responsive.isDesktop(context)
                ? const EdgeInsets.symmetric(horizontal: 15, vertical: 15)
                : const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            child: Container(
                padding: Responsive.isDesktop(context)
                    ? const EdgeInsets.symmetric(horizontal: 15, vertical: 15)
                    : const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1), // Glass effect
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.3)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                        filter: ImageFilter.blur(
                            sigmaX: 10, sigmaY: 10), // Blur effect
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                                child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(
                                        8), // Padding around the icon
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      shape: BoxShape
                                          .rectangle, // Shape of the border (you can change to BoxShape.rectangle if needed)
                                      border: Border.all(
                                        color: AppColors
                                            .neutral100, // Border color
                                        width: 2.0, // Border width
                                      ),
                                    ),
                                    child: icon, // Your icon widget here
                                  ),
                                  const SizedBox(height: 24),
                                  GradientText(
                                    title,
                                    style: AppTextStyles.displaySmallBold
                                        .copyWith(color: AppColors.neutral900),
                                    gradient: !isConnected
                                        ? const LinearGradient(colors: [
                                            Color.fromARGB(255, 201, 5, 255),
                                            Color.fromARGB(255, 136, 0, 255)
                                          ])
                                        : const LinearGradient(colors: [
                                            Color.fromARGB(255, 255, 156, 156),
                                            Color.fromARGB(255, 255, 206, 157)
                                          ]),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    description,
                                    style: AppTextStyles.bodyMediumRegular
                                        .copyWith(color: AppColors.neutral300),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )))))))
      ],
    );
  }
}
