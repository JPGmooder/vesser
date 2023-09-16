import 'dart:async';

import '../../../../core/models/exceptions.dart';
import '../../../../core/models/usecase.dart';
import '../entities/internet_checker.dart';
import '../repositories/internet_connection_repository.dart';

final class InitConnectionUseCase
    implements UseCase<FutureOr<Stream<InternetCheckerEntity>>> {
  IInternetConnectionRepository repository;
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
