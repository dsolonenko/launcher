import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:launcher/home.dart';
import 'package:system_date_time_format/system_date_time_format.dart';

void main() {
  runApp(
    ProviderScope(
      child: SDTFScope(
        child: MyApp(),
      ),
    ),
  );
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
  ],
);

class MyApp extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'tLauncher',
      theme: _buildTheme(FlexThemeData.light(scheme: FlexScheme.mandyRed)),
      darkTheme: _buildTheme(FlexThemeData.dark(scheme: FlexScheme.mandyRed)),
      themeMode: ThemeMode.system,
      routerConfig: _router,
    );
  }

  _buildTheme(ThemeData themeData) {
    return themeData.copyWith(
      textTheme: themeData.textTheme.apply(
        fontFamily: 'RobotoCondensed',
      ),
    );
  }
}
