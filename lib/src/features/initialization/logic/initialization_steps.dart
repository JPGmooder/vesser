import 'dart:async';

import 'package:vesser/src/features/initialization/model/initialization_proccess.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:vesser/src/features/start/data/repositories/internet_checker_repository_impl.dart';
import 'package:vesser/src/features/start/data/services/check_internet_connection_service.dart';
import 'package:vesser/src/features/start/logic/repositories/initializaition_repository.dart';
import 'package:vesser/src/features/start/logic/repositories/internet_connection_repository.dart';

/// Function which represents a single step of initialization
typedef StepAction = FutureOr<void>? Function(InitializationProccess progress);

/// The initialization steps which are executed in order they are defined.
/// 
/// The [Dependencies] object is passed to each step, which allows the step to
/// set the dependency, and the next step to use it.
mixin InitializationSteps {

  final initializationSteps = <String, StepAction>{
    "Initialize internet checker": (progress) async {
      InternetConnection internetChecker = InternetConnection.createInstance();
      progress.dependencies.connectivityCheckerConnection = internetChecker;
    },
    "Initialize checker of connection type": (progress) async {
      Connectivity connectivity = Connectivity();
      progress.dependencies.connectivity = connectivity;
    },
    "Initialize service of internet checkers": (progress) async {
      CheckInternetConnectionServiceImpl internetService =
          CheckInternetConnectionServiceImpl(
              statusService: CheckInternetStatusServiceImpl(
                  connectionSource:
                      progress.dependencies.connectivityCheckerConnection),
              typeService: CheckInternetTypeServiceImpl(
                  connectionSource: progress.dependencies.connectivity));

      progress.dependencies.connectionService = internetService;
    },
    "Initialize internetConnectionRepository": (progress) async {
      IInternetConnectionRepository connectionRepository =
          InternetConnectionRepositoryImpl(
              internetConnectionService: progress.dependencies.connectionService
                  as CheckInternetConnectionServiceImpl);
      progress.dependencies.internetConnectionRepository = connectionRepository;
    },
  };
}
