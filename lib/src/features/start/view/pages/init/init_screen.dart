import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:vesser/src/features/start/data/repositories/internet_checker_repository_impl.dart';
import 'package:vesser/src/features/start/data/services/check_internet_connection_service.dart';
import 'package:vesser/src/features/start/logic/entities/internet_checker.dart';
import 'package:vesser/src/features/start/logic/usecases/initi_connecetion_usecase.dart';

/// {@template init_screen}
/// InitScreen widget.
/// {@endtemplate}
class InitScreen extends StatefulWidget {
  /// {@macro init_screen}
  const InitScreen({
    required this.child,
    super.key,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  State<InitScreen> createState() => _InitScreenState();
}

/// State for widget InitScreen.
class _InitScreenState extends State<InitScreen> {
  /* #region Lifecycle */
  late InitConnectionUseCase _internetCase;
  late Stream<InternetCheckerEntity> _currentInternetChecker;
  late StreamSubscription _currentInternerSub;
  InternetCheckerEntity? entity;
  @override
  void initState() {
    _internetCase = InitConnectionUseCase(
        repository: InternetConnectionRepositoryImpl(
            internetConnectionService: CheckInternetConnectionServiceImpl(
                statusService: CheckInternetStatusServiceImpl(
                    connectionSource: InternetConnection()),
                typeService: CheckInternetTypeServiceImpl(
                    connectionSource: Connectivity()))));
    super.initState();
  }

  @override
  void didUpdateWidget(InitScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Widget configuration changed
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // The configuration of InheritedWidgets has changed
    // Also called after initState but before build
  }

  @override
  void dispose() {
    // Permanent removal of a tree stent
    super.dispose();
  }

  /* #endregion */

  @override
  Widget build(BuildContext context) => _InheritedInitScreen(
        state: this,
        child: widget.child,
      );
}

/// Inherited widget for quick access in the element tree.
class _InheritedInitScreen extends InheritedWidget {
  const _InheritedInitScreen({
    required this.state,
    required super.child,
  });

  final _InitScreenState state;

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  /// For example: `InitScreen.maybeOf(context)`.
  static _InheritedInitScreen? maybeOf(BuildContext context,
          {bool listen = true}) =>
      listen
          ? context.dependOnInheritedWidgetOfExactType<_InheritedInitScreen>()
          : context
              .getElementForInheritedWidgetOfExactType<_InheritedInitScreen>()
              ?.widget as _InheritedInitScreen?;

  static Never _notFoundInheritedWidgetOfExactType() => throw ArgumentError(
        'Out of scope, not found inherited widget '
            'a _InheritedInitScreen of the exact type',
        'out_of_scope',
      );

  /// The state from the closest instance of this class
  /// that encloses the given context.
  /// For example: `InitScreen.of(context)`.
  static _InheritedInitScreen of(BuildContext context, {bool listen = true}) =>
      maybeOf(context, listen: listen) ?? _notFoundInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(covariant _InheritedInitScreen oldWidget) => false;
}
