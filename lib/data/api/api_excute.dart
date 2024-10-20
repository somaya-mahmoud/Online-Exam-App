import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';
import 'package:online_exam_app/domain/common/CustomExceptions.dart';

Future<ApiResult<T>> executeApi<T>(Future<T> Function() apiCall) async {
  try {
    var result = await apiCall.call();
    return Success(result);
  } on Exception catch (e) {
    return Fail(e);
  }
}

