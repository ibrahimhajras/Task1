
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/View/View_Mp3/soune_Mp3.dart';
import 'package:untitled1/View/View_Users/view_user.dart';

import '../../Model/List_Appbar.dart';
import '../Pdf_Page/pdf_page.dart';
import '../View_Video/view_video.dart';

class Home_AppBar extends StatelessWidget {
  const Home_AppBar({super.key});

  @override
  Widget build(BuildContext context) {
     int tabsCount = titles.length;
    return DefaultTabController(
      initialIndex: 0,
      length: tabsCount,
      child: Scaffold(
        appBar: AppBar(
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          scrolledUnderElevation: 4.0,
          shadowColor: Theme.of(context).shadowColor,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: const Icon(Icons.person_search_rounded),
                text: titles[0],
                ),
              Tab(
                icon: const Icon(Icons.video_camera_back_outlined),
                text: titles[1],
              ),
              Tab(
                icon: const Icon(Icons.record_voice_over),
                text: titles[2],
              ),
              Tab(
                icon: const Icon(Icons.file_copy),
                text: titles[3],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            View_User(),
            ViewVideo(),
            Sound_MP3(),
            Pdf_Page(),
          ],
        ),
      ),
    );
  }
}
