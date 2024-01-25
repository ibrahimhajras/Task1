import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc_State_Managment/bloc/user_bloc.dart';
import '../../Bloc_State_Managment/bloc/user_event.dart';
import '../../Bloc_State_Managment/bloc/user_state.dart';
import '../../Model/User.dart';
import 'component/buildBloc.dart';

class View_User extends StatefulWidget {
  View_User({Key? key}) : super(key: key);

  @override
  State<View_User> createState() => _View_UserState();
}

class _View_UserState extends State<View_User> {
  bool change = true;
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return buildBloc();
  }
}
