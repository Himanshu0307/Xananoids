import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerW extends StatefulWidget {
  @override
  _VideoPlayerWState createState() => _VideoPlayerWState();
}

class _VideoPlayerWState extends State<VideoPlayerW> {
  VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/xananoids-305f9.appspot.com/o/Video%2FXananoids%20The%20Robotic%20People.mp4?alt=media&token=9ec4f5c9-17db-4492-8022-36eb915fb6c3')
      ..initialize().then((_) {
        setState(() {
          _controller.play();
          _controller.setLooping(true);
          _controller.setVolume(0);
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size pagesize = MediaQuery.of(context).size;
    return Container(
      height: pagesize.height * 0.8,
      width: pagesize.width,
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: MediaQuery.of(context).size.aspectRatio,
              child: VideoPlayer(
                _controller,
              ),
            )
          : Container(),
    );
  }
}
