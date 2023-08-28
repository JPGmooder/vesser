import 'dart:async';

import '../model/internet_checker.dart';

abstract class InternetConnectionRepository {
  FutureOr<Stream<InternetChecker>> initilizeInternetConnection();
}
