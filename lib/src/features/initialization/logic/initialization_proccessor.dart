import 'package:vesser/src/features/initialization/logic/initialization_factory.dart';
import 'package:vesser/src/features/initialization/logic/initialization_steps.dart';
import 'package:vesser/src/features/initialization/model/dependencies.dart';
import 'package:vesser/src/features/initialization/model/initialization_proccess.dart';
import 'package:vesser/src/features/initialization/model/intialization_hook.dart';

/// {@template InitializationProccessor}
/// A class which is responsible to proccess initialization
/// {@endtemplate}
mixin InitializationProccessor {
  Future<InitializationResult> proccessInitialization(
      {required Map<String, StepAction> steps,
      required InitializationHook hook,
      required InitializationFactory factory}) async {
    var timer = Stopwatch()..start();
    var stepCount = 0;
    final env = factory.getEnviromentStore();
    final progress = InitializationProccess(
        enviromentStore: env, dependencies: DependenciesMutable());
    hook.onInit?.call();
    try {
      await for (var step in Stream.fromIterable(steps.entries)) {
        stepCount++;
        var stopWatch = Stopwatch()..start();
        await step.value(progress);
        hook.onInitializing?.call(InitializationStepInfo(
            stepName: step.key,
            step: stepCount,
            stepsCount: steps.length,
            msSpent: (stopWatch..stop()).elapsedMilliseconds));
      }
    } catch (e, stacktrace) {
      hook.onError?.call(stepCount, e);
      Error.throwWithStackTrace(e, stacktrace);
    }
    timer.stop();
    var initResult = InitializationResult(
        dependencies: progress.freeze(),
        stepsCount: stepCount,
        milissecondsSpend: timer.elapsedMilliseconds);
    hook.onInitilized?.call(initResult);
    return initResult;
  }
}

/// {@template initialization_step_info}
/// A class which contains information about initialization step.
/// {@endtemplate}
class InitializationStepInfo {
  /// {@macro initialization_step_info}
  const InitializationStepInfo({
    required this.stepName,
    required this.step,
    required this.stepsCount,
    required this.msSpent,
  });

  /// The number of the step.
  final int step;

  /// The name of the step.
  final String stepName;

  /// The total number of steps.
  final int stepsCount;

  /// The number of milliseconds spent on the step.
  final int msSpent;
}
