class ConnectionUnavalableException implements Exception {
  Object exception;
  ConnectionUnavalableException({
    required this.exception,
  });
  @override
  String toString() => exception.toString();
}
