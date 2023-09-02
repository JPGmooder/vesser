import 'dart:async';

import '../entities/internet_checker.dart';

abstract class InternetConnectionRepository {
  FutureOr<Stream<InternetCheckerEntity>> initilizeInternetConnection();
}
