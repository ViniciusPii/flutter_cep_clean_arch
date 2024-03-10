import 'package:flutter/material.dart';
import 'package:flutter_arch/src/presentation/home/home_page.dart';

class AppRoutes {
  static String home = '/home';

  static final Map<String, WidgetBuilder> routes = {
    home: (_) => const HomePage(),
  };
}
