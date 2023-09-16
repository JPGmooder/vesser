import 'dart:io';

import 'package:flutter/foundation.dart';

@immutable
 class Platformer {
  @pragma("vm:platform-const")
  static const String android = "ANDROID";

  @pragma("vm:platform-const")
  static const String ios = "IOS";

  @pragma("vm:platform-const")
  static const String macos = "MACOS";

  @pragma("vm:platform-const")
  static const String windows = "WINDOWS";

  @pragma("vm:platform-const")
  static const String linux = "LINUX";

  @pragma("vm:platform-const")
  static const String fuchsia = "FUCHSIA";

   String getPlatform() {
    switch (Platform.operatingSystem) {
      case "linux":
        return linux;
      case "macos":
        return macos;
      case "windows":
        return windows;
      case "android":
        return android;

      case "ios":
        return ios;

      case "fuchsia":
        return fuchsia;
      default:
        throw UnimplementedError();
    }
  }
}
