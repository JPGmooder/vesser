import 'package:flutter/widgets.dart';

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
  @override
  void initState() {
    super.initState();
    // Initial state initialization
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
