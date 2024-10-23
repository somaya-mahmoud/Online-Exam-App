

import '../../../data/models/login_response/User.dart';
import '../../base/base_states.dart';

class UserSignedState extends BaseState {
  final User person;

  UserSignedState(this.person);
}

class UserNotSignedState extends BaseState {}
