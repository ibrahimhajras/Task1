import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/Bloc_State_Managment/bloc/user_bloc.dart';
import 'View/AppBar_Screen/home_appbar.dart';
import 'View/View_Users/view_user.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
          body: BlocProvider(
              create: (context) => UsersBloc(), child: Home_AppBar())),
    );
  }
}
