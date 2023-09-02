import 'dart:async';

import '../../../../common/models/exceptions.dart';
import '../../../../common/models/usecase.dart';
import '../entities/internet_checker.dart';
import '../repositories/internet_connection_repository.dart';

class InitConnectionUseCase
    implements UseCase<Future<Stream<InternetCheckerEntity>>> {
  InternetConnectionRepository repository;
  InitConnectionUseCase({
    required this.repository,
  });

  @override
  Future<Stream<InternetCheckerEntity>> call() async {
    try {
      return await repository.initilizeInternetConnection();
    } catch (exception, stackTrace) {
      Error.throwWithStackTrace(
          ConnectionUnavalableException(exception: exception), stackTrace);
    }
  }
}
