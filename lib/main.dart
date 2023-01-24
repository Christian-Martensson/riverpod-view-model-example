import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_view_model_example/modules/counter/counter_screen.dart';
import 'package:riverpod_view_model_example/global/dark_mode_controller.dart';
import 'package:riverpod_view_model_example/service_locator.dart';

void main() {
  App.registerSingletons();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(
        builder: (context, ref, child) {
          final isDarkMode = ref.watch(DarkModeController.provider);

          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Riverpod ViewModel Example',
            theme: isDarkMode
                ? ThemeData(brightness: Brightness.dark)
                : ThemeData(brightness: Brightness.light),
            routeInformationParser: App.router.goRouter.routeInformationParser,
            routerDelegate: App.router.goRouter.routerDelegate,
            routeInformationProvider:
                App.router.goRouter.routeInformationProvider,
          );
        },
      ),
    );
  }
}
