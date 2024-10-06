import 'package:flutter/material.dart';
import 'package:landify_design_flutter/landing_page/design_systems/colors/colors.dart';

enum ToastType { success, warning, error }

class CustomToast {
  static Future<void> show(
      BuildContext? context, String message, ToastType type) async {
    final overlay = Overlay.of(context!);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 50.0,
        left: MediaQuery.of(context).size.width * 0.4,
        right: MediaQuery.of(context).size.width * 0.4,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            decoration: BoxDecoration(
              color: _getToastColor(type),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);
    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }

  static Color _getToastColor(ToastType type) {
    switch (type) {
      case ToastType.success:
        return AppColors.kSuccessColor.withOpacity(0.7);
      case ToastType.warning:
        return AppColors.kWarningColor.withOpacity(0.7);
      case ToastType.error:
        return AppColors.kErrorColor.withOpacity(0.7);
      default:
        return AppColors.kInfoColor.withOpacity(0.7);
    }
  }
}
