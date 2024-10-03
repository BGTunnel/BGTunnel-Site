import 'package:flutter/material.dart';
import 'package:landify_design_flutter/landing_page/utils/breakpoint.dart';
import 'package:landify_design_flutter/landing_page/utils/constants.dart';

class MaxContainer extends StatelessWidget {
  const MaxContainer({
    super.key,
    required this.child,
    this.childColor,
    this.border, // Added border parameter
    this.padding, // Added padding parameter
  });

  final Color? childColor;
  final Widget child;
  final BorderRadius? border; // New border property
  final EdgeInsetsGeometry? padding; // New padding property

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);
    double paddingContainer = Constants.paddingContainer;

    if (breakpoint.equals(Breakpoint.desktop)) {
      paddingContainer = 0.0;
    }

    return Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: padding ??
              EdgeInsets.symmetric(
                  horizontal: paddingContainer), // Use dynamic padding
          child: Container(
            constraints: const BoxConstraints(maxWidth: Constants.maxContainer),
            decoration: BoxDecoration(
              color: childColor ?? Colors.transparent,
              borderRadius: border, // Use the border here
            ),
            child: child,
          ),
        ));
  }
}
