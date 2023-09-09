import 'dart:async';

import 'package:vesser/src/features/start/logic/entities/internet_checker.dart';
import 'package:vesser/src/features/start/logic/repositories/internet_connection_repository.dart';

import '../../logic/repositories/initializaition_repository.dart';

final class InitializationRepositoryImpl
    implements IInitializationRepository<InternetCheckerEntity> {
  IInternetConnectionRepository internetConnectionRepository;
  InitializationRepositoryImpl({required this.internetConnectionRepository});
  @override
  FutureOr<Stream<InternetCheckerEntity>> initilizeInternetConnection() async =>
      await internetConnectionRepository.initilizeInternetConnection();

  @override
  FutureOr<InternetCheckerEntity> getCurrentInternetConnection() {
    // TODO: implement getCurrentInternetConnection
    throw UnimplementedError();
  }
}
