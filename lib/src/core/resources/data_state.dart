abstract class DataState<T> {
  final T? data;
  final String? errorMessage;

  DataState({this.data, this.errorMessage});
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T data) : super(data: data);
}

class DataFailed extends DataState {
  DataFailed(String errorMessage) : super(errorMessage: errorMessage);
}
