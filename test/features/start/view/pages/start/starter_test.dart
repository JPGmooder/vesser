
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:vesser/src/common/helpers/platform.dart';
import 'package:vesser/src/features/start/view/pages/start/starter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vesser/src/features/start/view/pages/start/starter_io.dart';

import 'starter_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Platformer>()])
void main() {
  late AppStarterImpl starter;
  late MockPlatformer platformer;
  setUp(() {
    platformer = MockPlatformer();
    starter = AppStarterImpl(platformer: platformer);
  });

  group("IO test.", () {


    group("should return MaterialApp if Platform is", () {
      test("Android", () {
        when(platformer.getPlatform()).thenReturn(Platformer.android);
        var loadedApp = starter.loadApp();
        expect(loadedApp.appWidget, isA<MaterialApp>());
      });
      test("Fuchsia", () {
        when(platformer.getPlatform()).thenReturn(Platformer.fuchsia);
        var loadedApp = starter.loadApp();
        expect(loadedApp.appWidget, isA<MaterialApp>());
      });
    });

    group("should return CupertinoApp if Platform is", () {
      test("IOS", () {
        when(platformer.getPlatform()).thenReturn(Platformer.ios);
        var loadedApp = starter.loadApp();
        expect(loadedApp.appWidget, isA<CupertinoApp>());
      });
      test("MacOS", () {
        when(platformer.getPlatform()).thenReturn(Platformer.macos);
        var loadedApp = starter.loadApp();
        expect(loadedApp.appWidget, isA<CupertinoApp>());
      });
      test("Linux", () {
        when(platformer.getPlatform()).thenReturn(Platformer.linux);
        var loadedApp = starter.loadApp();
        expect(loadedApp.appWidget, isA<CupertinoApp>());
      });
    });

    group("should return FluentAPP if Platform is", () {
      test("Windows", () {
        when(platformer.getPlatform()).thenReturn(Platformer.windows);
        var loadedApp = starter.loadApp();
        expect(loadedApp.appWidget, isA<FluentApp>());
      });
    });
  });
}
