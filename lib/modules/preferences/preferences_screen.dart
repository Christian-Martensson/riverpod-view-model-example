import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_view_model_example/modules/preferences/preferences_view_model.dart';
import 'package:riverpod_view_model_example/widgets/drawer.dart';

class PreferencesScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        PreferencesViewModel.provider.overrideWith((ref) {
          return PreferencesViewModel(ref);
        }),
      ],
      child: _PreferencesScreen(),
    );
  }
}

class _PreferencesScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(PreferencesViewModel.provider);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Preferences"),
      ),
      body: ListView(children: [
        _DarkModeCheckbox(),
      ]),
    );
  }
}

class _DarkModeCheckbox extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(PreferencesViewModel.provider);
    return CheckboxListTile(
      title: Text("Use dark mode"),
      value: ref.watch(viewModel.darkModeProvider),
      onChanged: viewModel.setDarkmode,
    );
  }
}
