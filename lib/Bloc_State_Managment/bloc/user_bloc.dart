import 'dart:async';
import 'package:untitled1/Bloc_State_Managment/bloc/user_event.dart';

import '../../Model/User.dart';
import '../bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersBloc extends Bloc<UserEvent, UserState> {
   UsersBloc() : super(InitialState()) {
    on<GetUserEvent>(_getUserList);
  }
}

  FutureOr<void> _getUserList(GetUserEvent event,
      Emitter<UserState> emit) async {
    emit(LoadingState());
    List<User> user = await ApiProvider().getUsers();
    emit(SuccessUserList(user));
  }
