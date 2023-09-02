import 'dart:convert';

import 'package:vesser/src/features/start/logic/entities/internet_checker.dart';

class InternetCheckerModel extends InternetCheckerEntity {
  InternetCheckerModel(
      {required super.connectivityStatus,
      required super.hasInternetConnection});

  @override
  operator ==(Object? other) {
    return other is InternetCheckerModel &&
        super.hasInternetConnection == other.hasInternetConnection &&
        super.connectivityStatus == other.connectivityStatus;
  }

  @override
  int get hashCode =>
      super.connectivityStatus.hashCode ^ super.hasInternetConnection.hashCode;
}
