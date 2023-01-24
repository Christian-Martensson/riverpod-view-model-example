import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_view_model_example/modules/counter/counter_view_model.dart';
import 'package:riverpod_view_model_example/widgets/drawer.dart';

class CounterScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        CounterViewModel.provider.overrideWith((ref) {
          final viewModel = CounterViewModel(ref);
          ref.onDispose(viewModel.dispose);
          return CounterViewModel(ref);
        }),
      ],
      child: _CounterScreen(),
    );
  }
}

class _CounterScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(CounterViewModel.provider);

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: Center(
        child: _CounterText(),
      ),
      floatingActionButton: _FAB(),
    );
  }
}

class _CounterText extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(CounterViewModel.provider);
    return Text(
      ref.watch(viewModel.counterProvider).toString(),
    );
  }
}

class _FAB extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(CounterViewModel.provider);
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: viewModel.increment,
    );
  }
}
