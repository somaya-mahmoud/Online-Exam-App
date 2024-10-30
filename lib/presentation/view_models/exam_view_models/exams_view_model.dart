import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';
import 'package:online_exam_app/domain/entities/exams_entity.dart';
import 'package:online_exam_app/domain/uses_cases/exam_use_cases/exams_use_case.dart';

@injectable
class ExamsViewModel extends Cubit<GetExamsState> {
  GetExamsUseCase getExamsUseCase;
  ExamsViewModel(this.getExamsUseCase) : super(GetExamsInitialState());

  void getExams() async {
    emit(GetExamsLoadingState());

    var result = await getExamsUseCase();
    switch (result) {
      case Success():
        return
          emit(GetExamsSuccessState(result.resultData));

      case Fail():
        return
          emit(GetExamsErrorState(result.errorData));

    }
  }

}

sealed class GetExamsState {}
class GetExamsInitialState extends GetExamsState {}

class GetExamsLoadingState extends GetExamsState {}

class GetExamsErrorState extends GetExamsState {
  Exception? exception;
  GetExamsErrorState(this.exception);
}

class GetExamsSuccessState extends GetExamsState {
  final List<ExamsEntity> exams;

  GetExamsSuccessState(this.exams);
}