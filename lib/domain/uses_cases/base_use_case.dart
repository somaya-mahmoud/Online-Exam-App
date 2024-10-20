

import 'package:online_exam_app/domain/common/ApiResult.dart';

abstract class BaseUseCase<INPUT, OUTPUT> {
  Future<ApiResult<OUTPUT>> call(INPUT input);
}

