part of '../init_bloc.dart';

sealed class InitEvent {}


class InitStartEvent extends InitEvent {
  InitStartEvent();
}
