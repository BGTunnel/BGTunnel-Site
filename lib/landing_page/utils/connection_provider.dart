import 'package:flutter_riverpod/flutter_riverpod.dart';

// Create a StateNotifier to manage the connection status
class ConnectionNotifier extends StateNotifier<bool> {
  ConnectionNotifier() : super(false); // Initially not connected

  // Method to update the connection status
  void updateConnectionStatus(bool status) {
    state = status;
  }
}

// Create a provider for the ConnectionNotifier
final connectionProvider =
    StateNotifierProvider<ConnectionNotifier, bool>((ref) {
  return ConnectionNotifier();
});
