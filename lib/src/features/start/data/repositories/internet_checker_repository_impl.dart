import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:vesser/src/features/start/data/services/check_internet_connection_service.dart';

import '../../logic/model/internet_checker.dart';
import '../../logic/repositories/internet_connection_repository.dart';

class InternetConnectionRepositoryImpl implements InternetConnectionRepository {
  CheckInternetConnectionService<InternetChecker> networkSource;
  InternetConnectionRepositoryImpl({
    required this.networkSource,
  });
  @override
  FutureOr<Stream<InternetChecker>> initilizeInternetConnection() async =>
      networkSource.getInternetChanges; //TODO остановился тут. Эта штука должна возвращать тип подключения. Добавить сервис на проверку интернетового.
}
