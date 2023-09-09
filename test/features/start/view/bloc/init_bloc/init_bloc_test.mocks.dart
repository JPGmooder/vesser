// Mocks generated by Mockito 5.4.2 from annotations
// in vesser/test/features/start/view/bloc/init_bloc/init_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i4;
import 'package:vesser/src/features/start/logic/repositories/initializaition_repository.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeFuture_0<T> extends _i1.SmartFake implements _i2.Future<T> {
  _FakeFuture_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [IInitializationRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIInitializationRepository<I> extends _i1.Mock
    implements _i3.IInitializationRepository<I> {
  @override
  _i2.FutureOr<_i2.Stream<I>> initilizeInternetConnection() =>
      (super.noSuchMethod(
        Invocation.method(
          #initilizeInternetConnection,
          [],
        ),
        returnValue: _i2.Future<_i2.Stream<I>>.value(_i2.Stream<I>.empty()),
        returnValueForMissingStub:
            _i2.Future<_i2.Stream<I>>.value(_i2.Stream<I>.empty()),
      ) as _i2.FutureOr<_i2.Stream<I>>);
  @override
  _i2.FutureOr<I> getCurrentInternetConnection() => (super.noSuchMethod(
        Invocation.method(
          #getCurrentInternetConnection,
          [],
        ),
        returnValue: _i4.ifNotNull(
              _i4.dummyValueOrNull<I>(
                this,
                Invocation.method(
                  #getCurrentInternetConnection,
                  [],
                ),
              ),
              (I v) => _i2.Future<I>.value(v),
            ) ??
            _FakeFuture_0<I>(
              this,
              Invocation.method(
                #getCurrentInternetConnection,
                [],
              ),
            ),
        returnValueForMissingStub: _i4.ifNotNull(
              _i4.dummyValueOrNull<I>(
                this,
                Invocation.method(
                  #getCurrentInternetConnection,
                  [],
                ),
              ),
              (I v) => _i2.Future<I>.value(v),
            ) ??
            _FakeFuture_0<I>(
              this,
              Invocation.method(
                #getCurrentInternetConnection,
                [],
              ),
            ),
      ) as _i2.FutureOr<I>);
}
