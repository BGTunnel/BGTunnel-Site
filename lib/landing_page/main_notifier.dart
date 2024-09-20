import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainNotifier extends StateNotifier<double> {
  MainNotifier() : super(0);

  // Function to update the scroll offset
  void onScrollOffsetChanged(double offset) {
    state = offset; // This updates the state with the new scroll offset
  }

  // Additional logic for color transparency based on the scroll offset
  bool isColorTransparent() {
    return state > 100; // Example logic: transparent if offset > 100
  }
}

// Create the provider for MainNotifier
final mainNotifierProvider = StateNotifierProvider<MainNotifier, double>((ref) {
  return MainNotifier();
});
