import 'dart:async';

import '../../../../common/models/exceptions.dart';
import '../../../../common/models/usecase.dart';
import '../model/internet_checker.dart';
import '../repositories/internet_connection_repository.dart';

class InitConnectionUseCase
    implements UseCase<Future<Stream<InternetChecker>>> {
  InternetConnectionRepository repository;
  InitConnectionUseCase({
    required this.repository,
  });

  @override
  Future<Stream<InternetChecker>> call() async {
    try {
      return await repository.initilizeInternetConnection();
    } catch (exception, stackTrace) {
      Error.throwWithStackTrace(
          ConnectionUnavalableException(exception: exception), stackTrace);
    }
  }
}
