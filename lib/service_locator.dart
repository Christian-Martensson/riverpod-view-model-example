import 'package:get_it/get_it.dart';
import 'package:riverpod_view_model_example/router.dart';

class App {
  static registerSingletons() {
    GetIt.I.registerSingleton(AppRouter());
  }

  static AppRouter get router => GetIt.I<AppRouter>();
}
