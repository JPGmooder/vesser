import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../common/helpers/platform.dart';

abstract class AppStarter {
  final Platformer platformer;

  AppStarter({
    required this.platformer,
  });

  AppLoader loadApp();

  void call() {
    var loader = loadApp();
    loader();
  }
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
