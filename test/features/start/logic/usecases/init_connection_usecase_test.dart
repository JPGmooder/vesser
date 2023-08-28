import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vesser/src/common/models/exceptions.dart';
import 'package:vesser/src/features/start/logic/model/internet_checker.dart';
import 'package:vesser/src/features/start/logic/repositories/internet_connection_repository.dart';
import 'package:vesser/src/features/start/logic/usecases/initi_connecetion_usecase.dart';

import 'init_connection_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<InternetConnectionRepository>()])
void main() {
  late MockInternetConnectionRepository repository;
  late InitConnectionUseCase usecase;
  late InternetChecker checker;
  setUp(() {
    repository = MockInternetConnectionRepository();
    usecase = InitConnectionUseCase(repository: repository);
  });
  checker = InternetChecker(
      connectivityStatus: InternetConnectionState.wifi,
      hasInternetConnection: true);

  group("Init connection usecase test", () {
    test(
        "Should return InternetChecker(Wifi, true) when connection is available",
        () async {
      when(repository.initilizeInternetConnection())
          .thenAnswer((realInvocation) => Stream.value(checker));
      var response = await usecase();
      expectLater(response, emits(checker));
      verify(repository.initilizeInternetConnection()).called(1);
    });

    setUp(() {
      checker = InternetChecker(
          connectivityStatus: InternetConnectionState.none,
          hasInternetConnection: false);
    });

    test(
        "Should return InternetChecker(none, false) when connection is unavailable",
        () async {
      when(repository.initilizeInternetConnection())
          .thenAnswer((realInvocation) => Stream.value(checker));
      var response = await usecase();
      await expectLater(response, emits(checker));
      verify(repository.initilizeInternetConnection()).called(1);
    });

    setUp(() {
      checker = InternetChecker(
          connectivityStatus: InternetConnectionState.none,
          hasInternetConnection: false);
    });

    test(
        "Should raise ConnectionUnavalableException when connection is unreachable",
        () async {
      when(repository.initilizeInternetConnection())
          .thenThrow(UnimplementedError());
      await expectLater(
          usecase(), throwsA(isA<ConnectionUnavalableException>()));
      verify(repository.initilizeInternetConnection()).called(1);
    });
  });
}
