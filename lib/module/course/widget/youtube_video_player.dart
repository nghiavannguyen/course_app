import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoPlayer extends StatefulWidget {
  final String youtubeUrl; // Ví dụ: https://www.youtube.com/watch?v=dQw4w9WgXcQ

  const YoutubeVideoPlayer({super.key, required this.youtubeUrl});

  @override
  State<YoutubeVideoPlayer> createState() => _YoutubeVideoPlayerState();
}

class _YoutubeVideoPlayerState extends State<YoutubeVideoPlayer> {
  late YoutubePlayerController _controller;
  late String _videoId;

  @override
  void initState() {
    super.initState();

    // Trích xuất videoId từ URL YouTube
    _videoId = YoutubePlayer.convertUrlToId(widget.youtubeUrl)!;

    _controller = YoutubePlayerController(
      initialVideoId: _videoId,
      flags: const YoutubePlayerFlags(
        showLiveFullscreenButton: false,
        disableDragSeek: true,
        enableCaption: true,
        hideThumbnail: true,
        autoPlay: true,
        mute: true,
        isLive: false,
        forceHD: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Giải phóng bộ nhớ
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.redAccent,
      ),
      builder: (context, player) => player,
    );
  }
}
