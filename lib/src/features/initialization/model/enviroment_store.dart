import 'package:vesser/src/features/initialization/model/dependencies.dart';
import 'package:vesser/src/features/initialization/model/enum/enviroment.dart';

/// Interface of enviroment store.
/// {@template environment_store}
/// It is need for storing enviroment variables in right way and also manage enviroment status.
/// {@endtemplate}
abstract interface class IEnviromentStore {
  /// Current enviroment value
  abstract final Enviroment enviroment;

  /// String of connection to centry DSN
  abstract final String centryDsn;

  /// Determine is enviroment in production status or not
  bool get isProduction => enviroment == Enviroment.prod;
}

/// {@macro environment_store}
class EnviromentStore extends IEnviromentStore {
  /// {@macro environment_store}

  static final _env = Enviroment.fromValue(const String.fromEnvironment("env"));

  @override
  String get centryDsn => const String.fromEnvironment("centry_dsn");

  @override
  Enviroment get enviroment => _env;
}
