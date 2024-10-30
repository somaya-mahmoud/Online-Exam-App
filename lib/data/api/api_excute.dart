import 'dart:async';
import 'package:online_exam_app/domain/common/ApiResult.dart';

Future<ApiResult<T>> executeApi<T>(Future<T> Function() apiCall) async {
  try {
    var result = await apiCall.call();
    return Success(result);
  } on Exception catch (e) {
    return Fail(e);
  }
}
