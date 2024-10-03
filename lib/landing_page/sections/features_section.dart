import 'package:aura_box/aura_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/label_with_description.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/max_container.dart';
import 'package:landify_design_flutter/landing_page/design_systems/typography/text_styles.dart';
import 'package:landify_design_flutter/landing_page/design_systems/colors/colors.dart';
import 'package:landify_design_flutter/landing_page/utils/breakpoint.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 50),
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
            child: AuraBox(
              spots: [
                // Places one blue spot in the center
                AuraSpot(
                  color: Colors.blue,
                  radius: 500.0,
                  alignment: Alignment.topCenter,
                  blurRadius: 55.0,
                  stops: const [0.0, 0.5],
                ),
                // Places one red spot in the bottom right
                AuraSpot(
                  color: Colors.red,
                  radius: 150.0,
                  alignment: Alignment.bottomRight,
                  blurRadius: 50.0,
                  stops: const [0.0, 0.7],
                ),
                AuraSpot(
                  color: Colors.blueAccent,
                  radius: 150.0,
                  alignment: Alignment.topLeft,
                  blurRadius: 10.0,
                  stops: const [0.0, 0.7],
                ),
              ],
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 96, horizontal: 50),
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
                          padding: const EdgeInsets.all(16),
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
                              'Harness the power of V2Ray with BGTunnel state-of-the-art VPN technology. Enjoy robust security and turbo-speed performance, ensuring unmatched privacy and unrestricted access.',
                          icon: Image.asset('assets/folder.png', height: 50),
                        ),
                        _FeatureItem(
                          title: 'User-Friendly ',
                          description:
                              'Experience effortless navigation with BGTunnel sleek and intuitive design. Connect to your V2Ray server, adjust settings, and manage your VPN easily with our modern, user-centric interface',
                          icon: Image.asset('assets/man.png', height: 50),
                        ),
                        _FeatureItem(
                          title: 'Protocol Support',
                          description:
                              'Choose from a range of protocols including VMess, Trojan, and Shadowsocks. BGTunnel comprehensive protocol support ensures you get the most secure and efficient VPN solution for your needs.',
                          icon: Image.asset('assets/server.png', height: 50),
                        ),
                        _FeatureItem(
                            title: 'Real-Time Monitoring',
                            description:
                                'Stay informed with real-time updates on your connection status and data usage. BGTunnel provides transparency and control, giving you a smooth and well-managed VPN experience.',
                            icon: Image.asset('assets/mobile-analytics.png',
                                height: 50)),
                        _FeatureItem(
                          title: 'Privacy Protection',
                          description:
                              'Safeguard your online activities with advanced encryption. BGTunnel ensures your personal information remains private and secure, whether you"re using public Wi-Fi or accessing sensitive data',
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
            )));
  }
}

class _FeatureItem extends StatelessWidget {
  const _FeatureItem({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;

  final String description;

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8), // Padding around the icon
            decoration: BoxDecoration(
              shape: BoxShape
                  .circle, // Shape of the border (you can change to BoxShape.rectangle if needed)
              border: Border.all(
                color: AppColors.secondary600, // Border color
                width: 3.0, // Border width
              ),
            ),
            child: icon, // Your icon widget here
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: AppTextStyles.displaySmallBold
                .copyWith(color: AppColors.neutral900),
            textAlign: TextAlign.center,
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
    ));
  }
}
