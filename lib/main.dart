import 'dart:async';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:vesser/features/start/web_starter.dart';

void main() {
  if (kIsWeb) {
    startWeb();
  }
}
