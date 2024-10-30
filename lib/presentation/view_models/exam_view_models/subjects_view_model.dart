import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';
import 'package:online_exam_app/domain/entities/subjects.dart';
import 'package:online_exam_app/domain/uses_cases/exam_use_cases/subjects_use_case.dart';

@injectable
class SubjectsViewModel extends Cubit<GetSubjectsState> {
  GetSubjectsUseCase getSubjectsUseCase;
  SubjectsViewModel(this.getSubjectsUseCase) : super(GetSubjectsInitialState());

  void getSubjects() async {
    emit(GetSubjectsLoadingState());

    var result = await getSubjectsUseCase();
    switch (result) {
      case Success():
        return
          emit(GetSubjectsSuccessState(result.resultData));

      case Fail():
        return
          emit(GetSubjectsErrorState(result.errorData));

    }
  }

}

sealed class GetSubjectsState {}
class BottomNavigationChangeState extends GetSubjectsState{}
class GetSubjectsInitialState extends GetSubjectsState {}

class GetSubjectsLoadingState extends GetSubjectsState {}

class GetSubjectsErrorState extends GetSubjectsState {
  Exception? exception;
  GetSubjectsErrorState(this.exception);
}

class GetSubjectsSuccessState extends GetSubjectsState {
  final List<Subject> subjects;

  GetSubjectsSuccessState(this.subjects);
}