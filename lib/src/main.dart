import 'dart:async';

import 'package:vesser/src/features/initialization/model/intialization_hook.dart';

import 'core/utils/helpers/platform.dart';
import 'features/start/view/pages/start/starter.dart';
import 'features/start/view/pages/start/starter_io.dart';
import 'core/utils/logger.dart';

@pragma('vm:entry-point')
void main() {
  var hook = InitializationHook.setup(
    onInit: () => logger.info("Инциалиазция началася"),
    onInitializing: (stepInfo) =>
        logger.info(stepInfo.msSpent.toString() + " ms : " + stepInfo.stepName),
    onInitilized: (result) => logger.info('Инициализация успешна!'),
    onError: (step, error) {
      logger.error("Ошибка на шаге $step", error: error);
    },
  );
  logger.runLogging(() => runZonedGuarded(() {
        AppStarter starter =
            AppStarterImpl(platformer: Platformer(), initializationHook: hook);
        starter();
      }, (error, stack) {
        print("Ошибка в ранзоне");
      }));
}
