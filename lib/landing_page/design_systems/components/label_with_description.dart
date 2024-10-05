import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:landify_design_flutter/landing_page/design_systems/components/gradient_text.dart';
import 'package:landify_design_flutter/landing_page/design_systems/typography/text_styles.dart';
import 'package:landify_design_flutter/landing_page/design_systems/colors/colors.dart';
import 'package:landify_design_flutter/landing_page/utils/breakpoint.dart';
import 'package:landify_design_flutter/landing_page/utils/connection_provider.dart';

enum LabelWithDescriptionAlign { start, center }

enum LabelWithDescriptionType { title, heading, small }

class LabelWithDescription extends ConsumerWidget {
  const LabelWithDescription({
    super.key,
    required this.title,
    required this.subtitle,
    this.labelWithDescriptionAlign = LabelWithDescriptionAlign.start,
    this.labelWithDescriptionType = LabelWithDescriptionType.title,
  });

  final String title;

  final String subtitle;

  final LabelWithDescriptionAlign labelWithDescriptionAlign;

  final LabelWithDescriptionType labelWithDescriptionType;

  CrossAxisAlignment get crossAxisAlignment {
    if (labelWithDescriptionAlign == LabelWithDescriptionAlign.start) {
      return CrossAxisAlignment.start;
    }

    return CrossAxisAlignment.center;
  }

  TextAlign get textAlign {
    if (labelWithDescriptionAlign == LabelWithDescriptionAlign.start) {
      return TextAlign.start;
    }

    return TextAlign.center;
  }

  TextStyle titleStyle(Breakpoint breakpoint) {
    TextStyle style;

    switch (labelWithDescriptionType) {
      case LabelWithDescriptionType.title:
        if (breakpoint.largerOrEqualToLaptop) {
          style = AppTextStyles.displayLargeBold;
        } else if (breakpoint.largerOrEqualToTablet) {
          style = AppTextStyles.displayMediumBold;
        } else {
          style = AppTextStyles.displaySmallBold;
        }
      case LabelWithDescriptionType.heading:
        if (breakpoint.largerOrEqualToLaptop) {
          style = AppTextStyles.displayExtraLargeBold;
        } else if (breakpoint.largerOrEqualToTablet) {
          style = AppTextStyles.displayLargeBold;
        } else {
          style = AppTextStyles.displayMediumBold;
        }
      case LabelWithDescriptionType.small:
        if (breakpoint.largerOrEqualToLaptop) {
          style = AppTextStyles.displayMediumBold;
        } else if (breakpoint.largerOrEqualToTablet) {
          style = AppTextStyles.displaySmallBold;
        } else {
          style = AppTextStyles.displayExtraSmallBold;
        }
    }

    return style;
  }

  TextStyle subtitleStyle(Breakpoint breakpoint) {
    TextStyle style;

    switch (labelWithDescriptionType) {
      case LabelWithDescriptionType.title:
        if (breakpoint.largerOrEqualToLaptop) {
          style = AppTextStyles.bodyLargeRegular;
        } else if (breakpoint.largerOrEqualToTablet) {
          style = AppTextStyles.bodyLargeRegular;
        } else {
          style = AppTextStyles.bodyMediumRegular;
        }
      case LabelWithDescriptionType.heading:
        style = AppTextStyles.bodyLargeRegular;
      case LabelWithDescriptionType.small:
        if (breakpoint.largerOrEqualToLaptop) {
          style = AppTextStyles.bodyMediumRegular;
        } else if (breakpoint.largerOrEqualToTablet) {
          style = AppTextStyles.bodyMediumRegular;
        } else {
          style = AppTextStyles.bodySmallRegular;
        }
    }

    return style;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final breakpoint = BreakpointProvider.of(context);
    final isConnected = ref.watch(connectionProvider);
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        GradientText(
          title,
          style: titleStyle(breakpoint),
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
        if (labelWithDescriptionType == LabelWithDescriptionType.heading) ...{
          const SizedBox(height: 16),
        } else if (labelWithDescriptionType ==
            LabelWithDescriptionType.title) ...{
          const SizedBox(height: 8),
        },
        GradientText(
          subtitle,
          style:
              subtitleStyle(breakpoint).copyWith(color: AppColors.neutral900),
          gradient: const LinearGradient(colors: [
            Color.fromARGB(255, 194, 232, 163),
            Color.fromARGB(255, 252, 208, 255)
          ]),
        ),
      ],
    );
  }
}
