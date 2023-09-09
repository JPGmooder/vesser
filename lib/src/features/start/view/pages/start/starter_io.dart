import 'dart:async';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/helpers/platform.dart';

import 'starter.dart';

class AppStarterImpl implements AppStarter {
  @override
  final Platformer platformer;

  AppStarterImpl({required this.platformer});

  @override
  AppLoader loadApp() {
    late Widget app;

    switch (platformer.getPlatform()) {
      case Platformer.android || Platformer.fuchsia:
        app = const MaterialApp();
        return AppAndroidLoader(appWidget: app);
      case Platformer.ios:
        app = const CupertinoApp();
        return AppIosLoader(appWidget: app);
      case Platformer.macos || Platformer.linux:
        app = const CupertinoApp();
        return AppMacosLoader(appWidget: app);
      case Platformer.windows:
        app = const FluentApp();
        return AppWindowsLoader(appWidget: app);
    }
    throw PlatformException(code: "404");
  }

  @override
  void call() {
    loadApp().call();
  }
}

class AppAndroidLoader implements AppLoader {
  @override
  Widget appWidget;
  AppAndroidLoader({
    required this.appWidget,
  });

  @override
  void call() {
    runZonedGuarded(() => runApp(appWidget), (error, stack) {});
  }
}

class AppIosLoader implements AppLoader {
  @override
  Widget appWidget;
  AppIosLoader({
    required this.appWidget,
  });

  @override
  void call() {
    runZonedGuarded(() => runApp(appWidget), (error, stack) {});
  }
}

class AppMacosLoader implements AppLoader {
  @override
  Widget appWidget;
  AppMacosLoader({
    required this.appWidget,
  });

  @override
  void call() {
    runZonedGuarded(() => runApp(appWidget), (error, stack) {});
  }
}

class AppWindowsLoader implements AppLoader {
  @override
  Widget appWidget;
  AppWindowsLoader({
    required this.appWidget,
  });

  @override
  void call() {
    runZonedGuarded(() => runApp(appWidget), (error, stack) {});
  }
}
