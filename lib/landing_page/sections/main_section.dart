import 'package:flutter/material.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/label_with_description.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/responsive_row_column.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/max_container.dart';
import 'package:landify_design_flutter/landing_page/utils/breakpoint.dart';
import 'package:landify_design_flutter/landing_page/utils/constants.dart';
import 'package:landify_design_flutter/landing_page/utils/open_store.dart';
import '../design_systems/components/main_background.dart';

class MainSection extends StatelessWidget {
  const MainSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Stack(
      children: [
        AnimatedColorBackground(
          primaryColor: Colors.deepPurple,
          secondaryColor: Colors.blue,
        ),
        MaxContainer(child: MainContent()),
      ],
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
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
              child:
                  Image.asset('assets/screenshot_mobile_1.png', height: 760)),
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
    final isMobile = breakpoint.equals(Breakpoint.mobile);

    return Align(
      alignment: breakpoint.largerOrEqualToTablet
          ? Alignment.topRight
          : Alignment.topLeft,
      child: const Padding(
        padding: EdgeInsets.only(left: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 16),
            OpenStore(
              imagePath: 'assets/google_play.png',
              url:
                  'https://play.google.com/store/apps/details?id=com.app.bgtunnel',
            ),
            SizedBox(width: 16),
            OpenStore(
              imagePath: 'assets/app_store.png',
              url:
                  'https://apps.apple.com/us/app/bgtunnel-secure-vpn-privacy/id6608970030',
            ),
          ],
        ),
      ),
    );
  }
}
