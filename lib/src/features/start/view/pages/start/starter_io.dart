import 'dart:async';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vesser/src/core/utils/logger.dart';
import 'package:vesser/src/features/initialization/logic/initialization_factory.dart';
import 'package:vesser/src/features/initialization/logic/initialization_proccessor.dart';
import 'package:vesser/src/features/initialization/logic/initialization_steps.dart';
import 'package:vesser/src/features/initialization/model/intialization_hook.dart';
import '../../../../../core/utils/helpers/platform.dart';

import 'starter.dart';

class AppStarterImpl
    with
        InitializationFactoryImpl,
        InitializationSteps,
        InitializationProccessor
    implements AppStarter {
  @override
  final Platformer platformer;
  @override
  final InitializationHook initializationHook;

  AppStarterImpl({required this.platformer, required this.initializationHook});

  @override
  AppLoader loadApp(result) {
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
  void call() async {
    var bindings = WidgetsFlutterBinding.ensureInitialized()..deferFirstFrame();

    FlutterError.onError = logger.logFlutterError;
    PlatformDispatcher.instance.onError = logger.logPlatformDispatcherError;
    final initializationResult = await proccessInitialization(
        steps: initializationSteps, hook: initializationHook, factory: this);

    loadApp(initializationResult).call();
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
    runApp(appWidget);
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
runApp(appWidget);
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
 runApp(appWidget);
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
 runApp(appWidget);
  }
}
