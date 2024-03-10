import 'package:flutter/material.dart';
import 'package:flutter_arch/src/di/inject.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBlocState<T extends StatefulWidget, C extends Cubit> extends State<T> {
  late final C controller;

  @override
  void initState() {
    super.initState();
    controller = getIt.get<C>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onReady(context);
    });
  }

  void onReady(BuildContext context) {}
}
