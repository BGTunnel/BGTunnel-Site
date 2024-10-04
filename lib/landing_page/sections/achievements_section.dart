import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/label_with_description.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/max_container.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/responsive_row_column.dart';
import 'package:landify_design_flutter/landing_page/utils/breakpoint.dart';

import '../shared/custom_appbar.dart';

class AchievementsSection extends StatelessWidget {
  const AchievementsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    return MaxContainer(
        padding: Responsive.isDesktop(context)
            ? const EdgeInsets.symmetric(horizontal: 50, vertical: 20)
            : const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        border: BorderRadius.circular(20),
        childColor: Colors.deepPurple.withAlpha(20),
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
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 50),
            child: ResponsiveRowColumn(
              layout:
                  breakpoint.getRowTypeWhenLargerOrEqualTo(Breakpoint.laptop),
              rowSpacing: 32,
              columnSpacing: 48,
              columnCrossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ResponsiveRowColumnItem(
                    rowFit: FlexFit.tight, child: _LabelWithDescription()),
                ResponsiveRowColumnItem(
                    rowFit: FlexFit.tight, child: _Achievements()),
              ],
            ),
          ),
        ));
  }
}

class _LabelWithDescription extends StatelessWidget {
  const _LabelWithDescription();

  @override
  Widget build(BuildContext context) {
    return const LabelWithDescription(
      title: 'Trusted Worldwide',
      subtitle: 'Trusted by over 600 million users and 10,000 teams',
    );
  }
}

class _Achievements extends StatelessWidget {
  const _Achievements();

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    int rowSizes = 4;
    int columnSizes = 1;

    if (breakpoint.largerOrEqualToLaptop) {
      rowSizes = 2;
      columnSizes = 2;
    }

    return LayoutGrid(
      rowSizes: List.generate(rowSizes, (_) => auto),
      columnSizes: List.generate(columnSizes, (_) => auto),
      rowGap: 40,
      columnGap: 32,
      children: [
        _AchievementItem(
          icon: Image.asset('assets/cabinet.png', height: 50),
          title: '99.99%',
          subtitle: 'For BGTunnel, with zero maintenance downtime',
        ),
        _AchievementItem(
          icon: Image.asset('assets/globe.png', height: 50),
          title: '60M+',
          subtitle: 'Trusted by over 60 million users around the world',
        ),
        _AchievementItem(
          icon: Image.asset('assets/teamwork.png', height: 50),
          title: 'Security',
          subtitle:
              'Cutting-edge encryption and security measures to ensure your data is always protected.',
        ),
        _AchievementItem(
          icon: Image.asset('assets/connection.png', height: 50),
          title: 'Coverage',
          subtitle:
              'Extensive network coverage to ensure you are always connected.',
        ),
      ],
    );
  }
}

class _AchievementItem extends StatelessWidget {
  const _AchievementItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final Widget icon;

  final String title;

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1), // Glass effect
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 16),
            Expanded(
              child: LabelWithDescription(
                title: title,
                subtitle: subtitle,
                labelWithDescriptionType: LabelWithDescriptionType.small,
              ),
            ),
          ],
        ));
  }
}
