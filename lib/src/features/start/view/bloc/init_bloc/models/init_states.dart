part of '../init_bloc.dart';

sealed class InitState {
  final int percent;
  InitState(this.percent)
      : assert(percent >= 0, "Percent value must be pozitive"),
        assert(percent <= 100, "Percent value can't be higher than 100");
  @override
  operator ==(Object? other) => other is InitState && other.percent == percent;

  @override
  int get hashCode => percent.hashCode ^ super.hashCode;
}

class InitInitialState extends InitState {
  InitInitialState() : super(0);
}

class InitProgressState<T> extends InitState {
  T type;
  InitProgressState(super.percent, {required this.type})
      : assert(type is! InitState, "Passed type must be type of InitState");
  @override
  operator ==(Object? other) =>
      other is InitProgressState &&
      other.percent == percent &&
      other.type == type;

  @override
  int get hashCode => percent.hashCode ^ type.hashCode ^ super.hashCode;
}

class InitInternetConnectionInitilizedState extends InitState {
  InternetCheckerEntity currentInternetState;
  Stream<InternetCheckerEntity> currentConnectionStream;
  InitInternetConnectionInitilizedState(super.percent,
      {required this.currentConnectionStream,
      required this.currentInternetState});
}

class InitEndedState extends InitState {
  InitEndedState() : super(100);
}

class InitErroredState extends InitState {
  bool isContinue;

  InitErroredState(super.percent, {required this.isContinue});
}
