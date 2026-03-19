import 'package:demo_banking/presentation/features/home/view/nav_view.dart';
import 'package:demo_banking/presentation/features/home/view/splash_view.dart';
import 'package:demo_banking/presentation/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Banking App Demo',
      theme: buildLightTheme(),
      home: SplashView(),
      // routes: AppRoutes.home, -> Skipped route setup for simplicity.
      // onGenerateRoute: RouteNames.generateRoute,
    );
  }
}
