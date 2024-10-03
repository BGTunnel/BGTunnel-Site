import 'package:aura_box/aura_box.dart';
import 'package:flutter/material.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/label_with_description.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/max_container.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/responsive_row_column.dart';
import 'package:landify_design_flutter/landing_page/design_systems/typography/text_styles.dart';
import 'package:landify_design_flutter/landing_page/design_systems/colors/colors.dart';
import 'package:landify_design_flutter/landing_page/utils/breakpoint.dart';
import 'dart:math';

class StoriesSection extends StatelessWidget {
  const StoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(50),
        child: MaxContainer(
            child: AuraBox(
          spots: [
            AuraSpot(
              color: Colors.deepPurple,
              radius: 500.0,
              alignment: Alignment.topCenter,
              blurRadius: 55.0,
              stops: const [0.0, 0.5],
            ),
            AuraSpot(
              color: Colors.lightBlue,
              radius: 150.0,
              alignment: Alignment.bottomRight,
              blurRadius: 50.0,
              stops: const [0.0, 0.7],
            ),
            AuraSpot(
              color: Colors.amber,
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
          child: Container(
            padding: const EdgeInsets.only(top: 64, bottom: 96),
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
            child: Stack(
              children: [
                Image.asset('assets/quote_background.png', height: 116),
                ResponsiveRowColumn(
                  layout: breakpoint
                      .getRowTypeWhenLargerOrEqualTo(Breakpoint.laptop),
                  rowSpacing: 32,
                  children: const [
                    ResponsiveRowColumnItem(
                      rowFit: FlexFit.tight,
                      child: _HeaderWithStories(),
                    ),
                    ResponsiveRowColumnItem(
                      rowFit: FlexFit.tight,
                      child: _Stories(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )));
  }
}

class _HeaderWithStories extends StatelessWidget {
  const _HeaderWithStories();

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    EdgeInsets padding = const EdgeInsets.only(top: 56, bottom: 32);
    double widthStoryContent = double.infinity;

    return LayoutBuilder(
      builder: (context, constraint) {
        if (breakpoint.largerOrEqualTo(Breakpoint.laptop)) {
          padding = const EdgeInsets.only(top: 56, left: 104);
          widthStoryContent = constraint.maxWidth * 0.7;
        }

        return Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LabelWithDescription(
                title: 'Real Stories from Real Customers',
                subtitle: 'Get inspired by these stories.',
              ),
              const SizedBox(height: 64),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: widthStoryContent,
                  child: _StoryItem(
                    icon: Row(children: [
                      const Icon(Icons.person),
                      Text(
                        'Alex Johnson',
                        style: AppTextStyles.bodyLargeBold.copyWith(
                          color: AppColors.neutral900,
                        ),
                      ),
                    ]),
                    story:
                        'Bgtunnel VPN works great for me. It’s fast, easy to use, and keeps my connection secure. I’m very satisfied with the service.',
                    personName: 'Very Reliable and Fast',
                  ),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: widthStoryContent,
                child: _StoryItem(
                  icon: Row(children: [
                    const Icon(Icons.person),
                    Text(
                      'Emily Davis',
                      style: AppTextStyles.bodyLargeBold.copyWith(
                        color: AppColors.neutral900,
                      ),
                    ),
                  ]),
                  story:
                      'I like Bgtunnel VPN. It’s reliable and secure, though sometimes the speed drops a bit. Customer support is good, and overall, it’s a solid choice.',
                  personName: 'Good VPN, Minor Speed Issues',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Stories extends StatelessWidget {
  const _Stories();

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    double widthStoryContent1 = double.infinity;
    double widthStoryContent2 = double.infinity;

    return LayoutBuilder(
      builder: (context, constraint) {
        if (breakpoint.equals(Breakpoint.desktop)) {
          widthStoryContent1 = constraint.maxWidth * 0.9;
          widthStoryContent2 = constraint.maxWidth * 0.7;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStoryItem(
                context,
                widthStoryContent1,
                'Michael Smith',
                'I love using Bgtunnel VPN. It’s fast, protects my data, and has lots of server options. Great for both work and streaming!',
                'Fast and Secure VPN!'),
            const SizedBox(height: 32),
            _buildStoryItem(
                context,
                widthStoryContent2,
                'Jessica Taylor',
                'Bgtunnel VPN is easy to use and works great. I had a setup issue, but support was quick to help. Good service with reliable speeds!',
                'Solid VPN with Helpful Support'),
            const SizedBox(height: 32),
            _buildStoryItem(
                context,
                widthStoryContent1,
                'David Lee',
                'For the price, Bgtunnel VPN is excellent. Fast, secure, and simple to set up. It does exactly what I need. Couldn’t ask for more!',
                'Amazing Value for Money'),
          ],
        );
      },
    );
  }

  Widget _buildStoryItem(BuildContext context, double width, String name,
      String story, String personName) {
    return SizedBox(
      width: width,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1), // Glass effect
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
              color: Colors.greenAccent.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/quote.png', height: 16),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          story,
                          style: AppTextStyles.bodyLargeRegular.copyWith(
                            color: AppColors.neutral900,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          personName,
                          style: AppTextStyles.bodyLargeBold.copyWith(
                            color: AppColors.neutral900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _StoryItem extends StatelessWidget {
  const _StoryItem({
    required this.icon,
    required this.story,
    required this.personName,
  });

  final Widget icon;

  final String story;

  final String personName;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1), // Glass effect
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
              color: Colors.greenAccent.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              icon,
              const SizedBox(height: 32),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/quote.png', height: 16),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          story,
                          style: AppTextStyles.bodyLargeRegular.copyWith(
                            color: AppColors.neutral900,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          personName,
                          style: AppTextStyles.bodyLargeBold.copyWith(
                            color: AppColors.neutral900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
