import 'package:vesser/src/features/initialization/logic/initialization_proccessor.dart';
import 'package:vesser/src/features/initialization/model/dependencies.dart';

abstract class InitializationHook {
  /// Called before initialization starts
  void Function()? onInit;

  /// Called on each step of initialization
  void Function(InitializationStepInfo stepInfo)? onInitializing;

  /// Called when initialization ended
  void Function(InitializationResult)? onInitilized;

  /// Called on error
  void Function(int, Object? error)? onError;

  InitializationHook({
    this.onInit,
    this.onInitializing,
    this.onInitilized,
    required this.onError,
  });

  factory InitializationHook.setup({
    void Function()? onInit,
    void Function(InitializationStepInfo stepInfo)? onInitializing,
    void Function(InitializationResult)? onInitilized,
    void Function(int, Object? error)? onError,
  }) = _Hook;
}

final class _Hook extends InitializationHook {
  _Hook({
    super.onInit,
    super.onInitializing,
    super.onInitilized,
    super.onError,
  });
}
