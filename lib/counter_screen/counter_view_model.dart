import 'package:hooks_riverpod/hooks_riverpod.dart';

class CounterViewModel {
  final Ref ref;
  CounterViewModel(this.ref);

  increment() {
    ref.read(counterProvider.notifier).state = ref.read(counterProvider) + 1;
  }

  static final provider = AutoDisposeProvider<CounterViewModel>(
      (ref) => throw UnimplementedError());

  final counterProvider = StateProvider((ref) => 0);

  void dispose() {}
}
