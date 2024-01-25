import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ViewVideo extends StatefulWidget {
  ViewVideo({Key? key}) : super(key: key);

  @override
  State<ViewVideo> createState() => _ViewVideoState();
}

class _ViewVideoState extends State<ViewVideo> {
  late List<FlickManager> flickManagers;

  @override
  void initState() {
    super.initState();
    flickManagers = List.generate(3,
          (index) => FlickManager(autoPlay: false,
        videoPlayerController: VideoPlayerController.asset("Video/$index.mp4")
          ..initialize().then((_) {
            setState(() {});
          }),
      ),
    );
  }

  @override
  void dispose() {
    for (var flickManager in flickManagers) {
      flickManager.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: const Text("Video Player"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: flickManagers.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(height: 50,),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: FlickVideoPlayer(flickManager: flickManagers[index]),

              ),
            ],
          );

        },
      ),
    );
  }
}

