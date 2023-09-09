import 'package:bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vesser/src/features/start/data/repositories/initialization_repository_impl.dart';
import 'package:vesser/src/features/start/logic/entities/internet_checker.dart';
import 'package:vesser/src/features/start/logic/repositories/initializaition_repository.dart';
import 'package:vesser/src/features/start/view/bloc/init_bloc/init_bloc.dart';
import 'init_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<IInitializationRepository>()])
void main() {
  late MockIInitializationRepository<InternetCheckerEntity> repository;
  late InitializationBloc bloc;
  setUp(() {
    repository = MockIInitializationRepository<InternetCheckerEntity>();
    bloc = InitializationBloc(repository: repository);
  });
  InternetCheckerEntity entityToEarn = InternetCheckerEntity(
      connectivityStatus: InternetConnectionState.mobile,
      hasInternetConnection: true);
  test("should return InitializationEnded when initialisation event is ended",
      () async {
    when(repository.getCurrentInternetConnection())
        .thenAnswer((realInvocation) => entityToEarn);
    when(repository.initilizeInternetConnection())
        .thenAnswer((realInvocation) async {
      await Future.delayed(Duration(seconds: 3));
      return Stream.value(entityToEarn);
    });
    expect(bloc.state, InitInitialState());
    bloc.add(InitStartEvent());
    await expectLater(bloc.stream, emitsThrough(isA<InitEndedState>()));
  });

  test("should call each repository method once when initialisation", () async {
    when(repository.getCurrentInternetConnection())
        .thenAnswer((realInvocation) => entityToEarn);
    when(repository.initilizeInternetConnection())
        .thenAnswer((realInvocation) async {
      return Stream.value(entityToEarn);
    });
    expect(bloc.state, InitInitialState());
    bloc.add(InitStartEvent());
    await expectLater(bloc.stream, emitsThrough(isA<InitEndedState>()));
    verify(repository.getCurrentInternetConnection()).called(1);
    verify(repository.initilizeInternetConnection()).called(1);
  });
}
