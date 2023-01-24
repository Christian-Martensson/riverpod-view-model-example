import 'package:hooks_riverpod/hooks_riverpod.dart';

class DarkModeController extends StateNotifier<bool> {
  static final provider =
      StateNotifierProvider<DarkModeController, bool>((ref) {
    return DarkModeController();
  });
  DarkModeController() : super(false);
  setState(bool value) {
    state = value;
  }
}
