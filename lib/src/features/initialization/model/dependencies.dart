import 'package:flutter/foundation.dart';
import 'package:vesser/src/features/start/data/services/check_internet_connection_service.dart';
import 'package:vesser/src/features/start/logic/repositories/initializaition_repository.dart';
import 'package:vesser/src/features/start/logic/repositories/internet_connection_repository.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

abstract base class Dependencies with Diagnosticable {
  /// internet connection repository
  abstract final IInternetConnectionRepository internetConnectionRepository;

  // /// initialization repository
  // abstract final IInitializationRepository initializationRepository;

  /// internet_connection_checker_plus dependency
  abstract final InternetConnection connectivityCheckerConnection;

  /// connectivity_plus dependency
  abstract final Connectivity connectivity;

  //service to determine internet conenction
  abstract final CheckInternetConnectionService connectionService;

  /// Freeze dependencies so they cannot be modified
  Dependencies freeze();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<IInternetConnectionRepository>(
          'internet connection repository', internetConnectionRepository,
          description:
              "Repository that used for checking internet connection status"),
    );
    // properties.add(
    //   DiagnosticsProperty<IInitializationRepository>(
    //       'initializing repository', initializationRepository,
    //       description:
    //           "Repository that used for initialize main project infostructures, such as internet connection checking"),
    // );

    properties.add(
      DiagnosticsProperty<InternetConnection>(
          'Connectivity checker', connectivityCheckerConnection,
          description:
              "Provider that used for checking current internet connection"),
    );

    properties.add(DiagnosticsProperty<Connectivity>(
        'Type of connectivity checker', connectivity,
        description:
            "Provider that used for checking current type of internet connection"));

    properties.add(
      DiagnosticsProperty<CheckInternetConnectionService>(
          'Internet connection service', connectionService,
          description:
              "Service, that combine type and status of internet connection"),
    );
  }
}

final class DependenciesMutable extends Dependencies {
  @override
  late IInternetConnectionRepository internetConnectionRepository;

  @override
  late InternetConnection connectivityCheckerConnection;

  @override
  late Connectivity connectivity;

  @override
  late CheckInternetConnectionService connectionService;

  @override
  Dependencies freeze() => _DependenciesImmutable(
      connectionService: connectionService,
      internetConnectionRepository: internetConnectionRepository,
      connectivityCheckerConnection: connectivityCheckerConnection,
      connectivity: connectivity);
}

final class _DependenciesImmutable extends Dependencies {
  _DependenciesImmutable(
      {required this.internetConnectionRepository,
      required this.connectivityCheckerConnection,
      required this.connectionService,
      required this.connectivity});
  @override
  final IInternetConnectionRepository internetConnectionRepository;

  @override
  final InternetConnection connectivityCheckerConnection;

  @override
  final Connectivity connectivity;

  @override
  final CheckInternetConnectionService connectionService;

  @override
  Dependencies freeze() => this;
}

final class InitializationResult {
  final Dependencies dependencies;
  final int stepsCount;
  final int milissecondsSpend;

  const InitializationResult(
      {required this.dependencies,
      required this.stepsCount,
      required this.milissecondsSpend});

  @override
  String toString() => 'InitializationResult('
      'dependencies: $dependencies, '
      'stepsCount: $stepsCount, '
      'milissecondsSpend: $milissecondsSpend'
      ')';
}
