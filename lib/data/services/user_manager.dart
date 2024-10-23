import 'package:online_exam_app/data/services/token_manager.dart';
import 'package:online_exam_app/di/di.dart';
import 'package:online_exam_app/domain/models/models.dart';


class UserManager {
  final TokenManager _tokenManager = getIt<TokenManager>();


  User? _currentPerson;



  User? get getCurrentPerson => _currentPerson;
  set setCurrentUser(User userModel) {
    _currentPerson = userModel;

    _tokenManager.setToken = userModel.token!;
  }
}
