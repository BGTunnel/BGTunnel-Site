import 'package:flutter/material.dart';
import 'package:landify_design_flutter/landing_page/design_systems/typography/text_styles.dart';
import 'package:landify_design_flutter/landing_page/design_systems/colors/colors.dart';

class TextLinkButton extends StatelessWidget {
  final void Function() onPressed;
  const TextLinkButton.light(this.text, {super.key, required this.onPressed})
      : color = AppColors.neutral900;

  const TextLinkButton.dark(this.text, {super.key, required this.onPressed}) : color = Colors.white;

  final String text;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SelectionContainer.disabled(
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          minimumSize: null,
          padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 12)),
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          foregroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.hovered)) {
                return AppColors.primary600;
              }

              if (states.contains(WidgetState.pressed)) {
                return AppColors.primary600;
              }

              return color;
            },
          ),
        ),
        child: Text(text, style: AppTextStyles.bodySmallSemiBold),
      ),
    );
  }
}
