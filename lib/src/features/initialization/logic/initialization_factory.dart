import 'package:vesser/src/features/initialization/model/enviroment_store.dart';

/// Factory to create pre-initialized objects
abstract class InitializationFactory {
  /// get enviroment store
  IEnviromentStore getEnviromentStore();
}

mixin InitializationFactoryImpl implements InitializationFactory {
  @override
  IEnviromentStore getEnviromentStore() {
    return EnviromentStore();
  }
}
