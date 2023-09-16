import 'package:vesser/src/features/initialization/model/dependencies.dart';
import 'package:vesser/src/features/initialization/model/enviroment_store.dart';

/// {@template InitializationProccess}
/// A class which represents current status of initialization proccess
/// {@endtemplate}
final class InitializationProccess {

  InitializationProccess(
      {required this.enviromentStore, required this.dependencies});

  /// Enviroment container
  final IEnviromentStore enviromentStore;

  /// Current mutable dependencies
  final DependenciesMutable dependencies;

  /// freze dependencies so they cannot be modified
  Dependencies freeze() => dependencies.freeze();
}
