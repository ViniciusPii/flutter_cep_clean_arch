import 'package:flutter/material.dart';
import 'package:flutter_arch/src/core/theme/app_theme.dart';
import 'package:flutter_arch/src/routes/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: AppRoutes.routes,
      theme: AppTheme.defaultTheme,
      initialRoute: AppRoutes.home,
      debugShowCheckedModeBanner: false,
    );
  }
}
