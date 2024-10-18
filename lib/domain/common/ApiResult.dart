sealed class ApiResult<T> {}

class Success<T> implements ApiResult<T> {
  final T resultData;
  Success(this.resultData);
}

class Fail<T> implements ApiResult<T> {
  final dynamic errorData;
  Fail(this.errorData);
}
