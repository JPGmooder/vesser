import 'dart:async';
import 'package:vesser/src/features/start/data/services/check_internet_connection_service.dart';
import '../../logic/entities/internet_checker.dart';
import '../../logic/repositories/internet_connection_repository.dart';

final class InternetConnectionRepositoryImpl
    implements IInternetConnectionRepository {
  CheckInternetConnectionService<InternetCheckerEntity>
      internetConnectionService;
  InternetConnectionRepositoryImpl({required this.internetConnectionService});
  @override
  FutureOr<Stream<InternetCheckerEntity>> initilizeInternetConnection() async {
    return internetConnectionService.internetConnectionChanges;
  }

  @override
  FutureOr<InternetCheckerEntity> getCurrentInternetConnection() async {
    return await internetConnectionService.currentConnectionStatus;
  }
}
