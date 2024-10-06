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
import 'package:flutter/material.dart';

class WhyChooseSection extends StatelessWidget {
  const WhyChooseSection({super.key});

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

                  final width =
                      breakpoint.largerOrEqualToLaptop ? halfWidth : fullWidth;

                  return Container(
                    width: width,
                    padding: Responsive.isDesktop(context)
                        ? const EdgeInsets.all(16)
                        : const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(bottom: 64),
                    child: const LabelWithDescription(
                      labelWithDescriptionAlign:
                          LabelWithDescriptionAlign.center,
                      title: "Why choose BGTunnel?",
                      subtitle:
                          'BGTunnel is a reliable VPN service that provides a variety of features designed to enhance your online security, privacy, and freedom.',
                    ),
                  );
                },
              ),
              // Improved Table Section
              _buildVpnFeaturesTable(), // Add the table here
              const SizedBox(height: 40), // Add space between table and grid
            ],
          ),
        ),
      ),
    );
  }

  // Updated, larger table with zebra striping
  Widget _buildVpnFeaturesTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900], // Slightly dark background
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white54), // Soft border
      ),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(4),
        },
        border: const TableBorder(
          horizontalInside: BorderSide(width: 1, color: Colors.white24),
        ),
        children: [
          _buildRow('Security', 'WebSocket, TCP, mKCP, gRPC', true),
          _buildRow('VPN Servers', '2300+ servers, 60 countries', false),
          _buildRow(
              'Protocols',
              'VMess, VLESS, Shadowsocks, Socks5, HTTP Proxy, gRPC, MTProto',
              true),
          _buildRow('Devices', 'unlimited', true),
          _buildRow('VPN Bandwidth', 'Unlimited', false),
          _buildRow('Leak Prevention', 'Traffic Encryption and IP', true),
          _buildRow('Money-back Guarantee', '30 days', false),
        ],
      ),
    );
  }

  TableRow _buildRow(String title, String description, bool isZebra) {
    return TableRow(
      decoration: BoxDecoration(
        color: isZebra
            ? Colors.blueAccent.withOpacity(0.2)
            : Colors.deepPurple.withOpacity(0.2), // Zebra striping
      ),
      children: [
        Padding(
          padding:
              const EdgeInsets.all(20.0), // Increased padding for bigger table
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18, // Increased font size
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.all(20.0), // Increased padding for bigger table
          child: Text(
            description,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16, // Increased font size
            ),
          ),
        ),
      ],
    );
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
        Padding(
          padding: Responsive.isDesktop(context)
              ? const EdgeInsets.symmetric(horizontal: 15, vertical: 15)
              : const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(8), // Padding around the icon
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: AppColors.neutral100, // Border color
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
        )
      ],
    );
  }
}
