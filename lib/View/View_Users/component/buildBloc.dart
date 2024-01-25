import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Bloc_State_Managment/bloc/user_bloc.dart';
import '../../../Bloc_State_Managment/bloc/user_event.dart';
import '../../../Bloc_State_Managment/bloc/user_state.dart';
import '../../../Model/User.dart';
import 'buildUserList.dart';

Widget buildBloc() {
  return BlocBuilder<UsersBloc, UserState>(builder: (context, state) {
    if (state is SuccessCreatedUser) {
      return Center(child: Text("Success Creating User"));
    }
    if (state is LoadingState)
      return Center(child: CircularProgressIndicator());
    if (state is SuccessUserList) {
      List<User> userList = state.userList;
      return buildUserList(userList);
    }
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  context.read<UsersBloc>().add(GetUserEvent());
                },
                child: Text("Get User List")),
          ],
        ));
  });
}