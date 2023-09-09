import 'dart:async';

import '../entities/internet_checker.dart';

abstract interface class IInternetConnectionRepository {
  FutureOr<Stream<InternetCheckerEntity>> initilizeInternetConnection();
  FutureOr<InternetCheckerEntity> getCurrentInternetConnection();
}
