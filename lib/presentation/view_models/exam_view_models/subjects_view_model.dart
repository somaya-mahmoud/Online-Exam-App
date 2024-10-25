import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/models/exam_response/SubjectsResponse.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';
import 'package:online_exam_app/domain/uses_cases/exam_use_cases/subjects_use_case.dart';

@injectable
class SubjectsViewModel extends Cubit<GetSubjectsState> {
  GetSubjectsUseCase getSubjectsUseCase;
  SubjectsViewModel(this.getSubjectsUseCase) : super(GetSubjectsInitialState());

  void getSubjects(String token) async {
    emit(GetSubjectsLoadingState());

    var result = await getSubjectsUseCase.invoke(token);
    switch (result) {
      case Success():
        {
          emit(GetSubjectsSuccessState(result.resultData));
        }
      case Fail():
        {
          emit(GetSubjectsErrorState(result.errorData));
        }
      case null:
    }
  }
}

sealed class GetSubjectsState {}

class GetSubjectsInitialState extends GetSubjectsState {}

class GetSubjectsLoadingState extends GetSubjectsState {

}

class GetSubjectsErrorState extends GetSubjectsState {
  Exception? exception;
  GetSubjectsErrorState(this.exception);
}

class GetSubjectsSuccessState extends GetSubjectsState {
  final List<Subjects> subjects;

  GetSubjectsSuccessState(this.subjects);
}