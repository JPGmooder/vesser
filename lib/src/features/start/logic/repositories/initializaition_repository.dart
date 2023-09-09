import 'dart:async';

abstract interface class IInitializationRepository<I> {
  FutureOr<Stream<I>> initilizeInternetConnection();
  FutureOr<I> getCurrentInternetConnection();
}
