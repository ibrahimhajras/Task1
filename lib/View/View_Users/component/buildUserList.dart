import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Model/User.dart';

Widget buildUserList(List<User> users) {
  return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text("${users[index].name}"),
              subtitle: Text("${users[index].email}"),
            ),
            Divider(),
          ],
        );
      });
}