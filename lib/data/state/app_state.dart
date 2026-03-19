sealed class AppState<T> {
  /// Returns list length if current state is [ListAppState]
  int? get itemCount => switch (this) {
    ListAppState() => (this as ListAppState).data.length,
    _ => null,
  };

  /// Returns data if current state is [SuccessAppState]
  T? get getData => switch (this) {
    SuccessAppState() => (this as SuccessAppState).data,
    _ => null,
  };

  /// Returns list of items if current state is [ListAppState]
  List<T> get listState => switch (this) {
    ListAppState() => (this as ListAppState<T>).data,
    _ => <T>[],
  };
}

class InitialAppState<T> extends AppState<T> {}

class LoadingAppState<T> extends AppState<T> {}

class EmptyAppState<T> extends AppState<T> {}

class SuccessAppState<T> extends AppState<T> {
  final T data;
  SuccessAppState(this.data);
}

class ListAppState<T> extends AppState<T> {
  final List<T> data;
  ListAppState([this.data = const []]);
}

class FailureAppState<T> extends AppState<T> {
  final dynamic error;
  final StackTrace? stackTrace;
  FailureAppState(this.error, [this.stackTrace]);
}
