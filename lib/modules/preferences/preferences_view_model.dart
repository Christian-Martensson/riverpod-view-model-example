import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_view_model_example/global/dark_mode_controller.dart';

class PreferencesViewModel {
  final Ref ref;
  PreferencesViewModel(this.ref);

  setDarkmode(bool? value) {
    if (value == null) return;
    ref.read(darkModeProvider.notifier).setState(value);
  }

  static final provider = AutoDisposeProvider<PreferencesViewModel>(
      (ref) => throw UnimplementedError());

  //! it's optional to declare this variable, but I prefer gathering all the
  //! providers that a screen uses inside the view model for better visibility
  final darkModeProvider = DarkModeController.provider;
  void dispose() {}
}
