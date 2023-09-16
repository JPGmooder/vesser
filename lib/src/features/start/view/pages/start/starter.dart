import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vesser/src/features/initialization/model/dependencies.dart';
import 'package:vesser/src/features/initialization/model/intialization_hook.dart';

import '../../../../../core/utils/helpers/platform.dart';

abstract class AppStarter {
  final Platformer platformer;
  final InitializationHook initializationHook;

  AppStarter({
    required this.initializationHook,
    required this.platformer,
  });

  AppLoader loadApp(InitializationResult initResult);

   void call();
}

abstract class AppLoader {
  Widget appWidget;
  AppLoader({
    required this.appWidget,
  }) : assert(
            !(appWidget is MaterialApp ||
                appWidget is CupertinoApp ||
                appWidget is FluentApp),
            "App widget should be type of MaterialApp or CupertinoApp or FluentApp");

  void call();
}
