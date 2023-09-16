/// {@template enviroment}
/// Simple enum to represent the environment
/// {@endtemplate}
enum Enviroment implements Comparable<Enviroment> {
  /// Developer (debug) enviroment
  dev('DEV'),

  /// Production enviroment
  prod('PROD');

  /// {@macro enviroment}
  const Enviroment(this.value);

  /// Creates a new instance of [Enviroment] from a given string.
  static Enviroment fromValue(String? value, {Enviroment? fallback}) {
    switch (value) {
      case 'DEV':
        return dev;
      case "PROD":
        return prod;

      default:
        return fallback ?? (throw ArgumentError.value(value));
    }
  }

  /// Value of the enum
  final String value;

  /// Pattern matching
  T map<T>({
    required T Function() dev,
    required T Function() prod,
  }) {
    switch (this) {
      case Enviroment.dev:
        return dev();
      case Enviroment.prod:
        return prod();
    }
  }

  /// Pattern matching
  T maybeMap<T>({
    required T Function() orElse,
    T Function()? dev,
    T Function()? prod,
  }) =>
      map<T>(dev: dev ?? orElse, prod: prod ?? orElse);

  /// Pattern matching
  T? maybeMapOrNull<T>({T Function()? dev, T Function()? prod}) => maybeMap<T?>(
        orElse: () => null,
        dev: dev,
        prod: prod,
      );

  @override
  int compareTo(Enviroment other) => index.compareTo(other.index);

  @override
  String toString() => value;
}
