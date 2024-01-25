
import '../../Model/User.dart';

abstract class UserState {}

class InitialState extends UserState {}

class SuccessUserList extends UserState {
  List<User> userList;
  SuccessUserList(this.userList);
}
class SuccessCreatedUser extends UserState{}
class LoadingState extends UserState {}