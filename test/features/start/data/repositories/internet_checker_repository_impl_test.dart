import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vesser/src/features/start/data/repositories/internet_checker_repository_impl.dart';
import 'package:vesser/src/features/start/data/services/check_internet_connection_service.dart';
import 'package:vesser/src/features/start/logic/entities/internet_checker.dart';

import 'internet_checker_repository_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<CheckInternetConnectionService>(),
])
void main() {
  late MockCheckInternetConnectionService<InternetCheckerEntity>
      internetConnectionService;
  late InternetConnectionRepositoryImpl repositoryImpl;
  late InternetCheckerEntity internetStatus;

  setUp(() {
    internetConnectionService =
        MockCheckInternetConnectionService<InternetCheckerEntity>();
    repositoryImpl = InternetConnectionRepositoryImpl(
        internetConnectionService: internetConnectionService);
    internetStatus = InternetCheckerEntity(
        connectivityStatus: InternetConnectionState.wifi,
        hasInternetConnection: true);
  });
  test("Should return a stream when connection is established", () async {
    when(internetConnectionService.internetConnectionChanges)
        .thenAnswer((_) => Stream.fromFuture(Future.delayed(
              Duration(seconds: 1),
              () => internetStatus,
            )));
    var response = await repositoryImpl.initilizeInternetConnection();
    await expectLater(response, emitsInOrder([internetStatus]));
    verify(internetConnectionService.internetConnectionChanges).called(1);
  });
}
