import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/max_container.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/responsive_row_column.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/text_link_button.dart';
import 'package:landify_design_flutter/landing_page/design_systems/typography/text_styles.dart';
import 'package:landify_design_flutter/landing_page/design_systems/colors/colors.dart';
import 'package:landify_design_flutter/landing_page/utils/breakpoint.dart';

import '../utils/open_store.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    return Container(
      color: Colors.black,
      width: double.infinity,
      child: MaxContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 64),
          child: ResponsiveRowColumn(
            layout: breakpoint.getRowTypeWhenLargerOrEqualTo(Breakpoint.tablet),
            columnCrossAxisAlignment: CrossAxisAlignment.start,
            rowSpacing: 32,
            columnSpacing: 32,
            children: const [
              ResponsiveRowColumnItem(
                  rowFit: FlexFit.tight, child: _Information()),
              ResponsiveRowColumnItem(rowFit: FlexFit.tight, child: _GetApps()),
            ],
          ),
        ),
      ),
    );
  }
}

class _Information extends StatelessWidget {
  const _Information();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Image.asset('assets/logo.png', height: 32, width: 32)),
        const SizedBox(height: 24),
        Wrap(
          children: [
            TextLinkButton.dark(
              'About',
              onPressed: () {
                GoRouter.of(context).go('/about');
              },
            ),
            TextLinkButton.dark(
              'Contact Us',
              onPressed: () {
                GoRouter.of(context).go('/contact');
              },
            ),
            TextLinkButton.dark(
              'Privacy Policy',
              onPressed: () {
                GoRouter.of(context).go('/privacy');
              },
            ),
            TextLinkButton.dark(
              'Terms of Service',
              onPressed: () {
                GoRouter.of(context).go('/terms');
              },
            ),
          ],
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            '© 2024 BGTunnel. All rights reserved',
            style: AppTextStyles.bodySmallRegular
                .copyWith(color: AppColors.neutral300),
          ),
        ),
      ],
    );
  }
}

class _GetApps extends StatelessWidget {
  const _GetApps();

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    return Align(
      alignment: breakpoint.largerOrEqualToTablet
          ? Alignment.topRight
          : Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: breakpoint.largerOrEqualToTablet
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Get the App',
                    style: AppTextStyles.bodyLargeMedium
                        .copyWith(color: AppColors.neutral300),
                  ),
                  const SizedBox(height: 16),
                  const OpenStore(
                    imagePath: 'assets/google_play.svg',
                    url:
                        'https://play.google.com/store/apps/details?id=com.app.bgtunnel',
                  ),
                  const SizedBox(height: 16),
                  const OpenStore(
                    imagePath: 'assets/app_store.svg',
                    url:
                        'https://apps.apple.com/us/app/bgtunnel-secure-vpn-privacy/id6608970030',
                  ),
                ],
              )
            : const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
              ),
      ),
    );
  }
}
