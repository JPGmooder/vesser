import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:vesser/src/features/start/data/services/check_internet_connection_service.dart';
import 'package:rxdart/rxdart.dart' as rx;
import '../../logic/entities/internet_checker.dart';
import '../../logic/repositories/internet_connection_repository.dart';

class InternetConnectionRepositoryImpl implements InternetConnectionRepository {
  CheckInternetConnectionService<InternetCheckerEntity>
      internetConnectionService;
  InternetConnectionRepositoryImpl({required this.internetConnectionService});
  @override
  FutureOr<Stream<InternetCheckerEntity>> initilizeInternetConnection() async {
    return internetConnectionService.internetConnectionChanges;
  }
}
