import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:vesser/src/features/start/logic/entities/internet_checker.dart';
import 'package:vesser/src/features/start/logic/repositories/initializaition_repository.dart';

part 'models/init_events.dart';
part 'models/init_states.dart';

/// Business Logic Component InitBLoC
class InitializationBloc extends Bloc<InitEvent, InitState>
    implements EventSink<InitEvent> {
  InitializationBloc({
    required final IInitializationRepository<InternetCheckerEntity> repository,
    final InitState? initialState,
  })  : _repository = repository,
        super(initialState ?? InitInitialState()) {
    on<InitEvent>(
      (event, emit) async {
        await _fetch(event, emit);
      },
      transformer: bloc_concurrency.restartable(),
    );
  }

  final IInitializationRepository<InternetCheckerEntity> _repository;

  /// Fetch event handler
  Future<void> _fetch(InitEvent event, Emitter<InitState> emit) async {
    switch (event) {
      case final InitStartEvent startEvent:
        try {
          emit(InitProgressState(0,
              type: InitInternetConnectionInitilizedState));
          var currentInternetStatus =
              await _repository.getCurrentInternetConnection();
          emit(InitProgressState(50,
              type: InitInternetConnectionInitilizedState));

          var initilizedInternetConnection =
              await _repository.initilizeInternetConnection();

          emit(InitInternetConnectionInitilizedState(99,
              currentConnectionStream: initilizedInternetConnection,
              currentInternetState: currentInternetStatus));
        } on Object catch (error, stackTrace) {
          emit(InitErroredState(99, isContinue: false));
          Error.throwWithStackTrace(error, stackTrace);
        }

        break;
      default:
    }
    emit(InitEndedState());
  }
}
