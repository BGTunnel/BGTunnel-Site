import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/homeIOS.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/label_with_description.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/responsive_row_column.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/max_container.dart';
import 'package:landify_design_flutter/landing_page/utils/breakpoint.dart';
import 'package:landify_design_flutter/landing_page/utils/connection_provider.dart';
import 'package:landify_design_flutter/landing_page/utils/constants.dart';
import 'package:landify_design_flutter/landing_page/utils/open_store.dart';

import '../shared/custom_appbar.dart';
import '../shared/random_shape.dart';

class MainSection extends ConsumerWidget {
  const MainSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MaxContainer(child: MainContent());
  }
}

class MainContent extends ConsumerWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final breakpoint = BreakpointProvider.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 72 + (Constants.kNavigationBarHeight / 2)),
      child: ResponsiveRowColumn(
        layout: breakpoint.getRowTypeWhenLargerOrEqualTo(Breakpoint.laptop),
        columnSpacing: 72,
        children: [
          const ResponsiveRowColumnItem(
            rowFit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelWithDescription(
                  title: 'Experience the Ultimate in Privacy with BGTunnel',
                  subtitle:
                      'Discover unparalleled privacy and freedom with BGTunnel, the premier VPN app driven by V2Ray technology. Engineered for users who demand top-tier security, flexibility, and seamless connectivity.',
                  labelWithDescriptionType: LabelWithDescriptionType.heading,
                ),
                SizedBox(height: 32),
                _InstructionButtons(),
              ],
            ),
          ),
          ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: SizedBox(
                height: 700,
                child: DeviceFrame(
                    device: Devices.ios.iPhone13ProMax,
                    isFrameVisible: true,
                    orientation: Orientation.portrait,
                    screen: const HomePageIOS()),
              )),
        ],
      ),
    );
  }
}

class _InstructionButtons extends StatelessWidget {
  const _InstructionButtons();

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    return Align(
      alignment: breakpoint.largerOrEqualToTablet
          ? Alignment.topRight
          : Alignment.topLeft,
      child: Responsive.isDesktop(context)
          ? const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 16),
                OpenStore(
                  imagePath: 'assets/google_play.svg',
                  url:
                      'https://play.google.com/store/apps/details?id=com.app.bgtunnel',
                ),
                SizedBox(width: 16),
                OpenStore(
                  imagePath: 'assets/app_store.svg',
                  url:
                      'https://apps.apple.com/us/app/bgtunnel-secure-vpn-privacy/id6608970030',
                ),
              ],
            )
          : const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 16),
                OpenStore(
                  imagePath: 'assets/google_play.svg',
                  url:
                      'https://play.google.com/store/apps/details?id=com.app.bgtunnel',
                ),
                SizedBox(height: 16),
                OpenStore(
                  imagePath: 'assets/app_store.svg',
                  url:
                      'https://apps.apple.com/us/app/bgtunnel-secure-vpn-privacy/id6608970030',
                ),
              ],
            ),
    );
  }
}
