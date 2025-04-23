import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class DuaaVideoPlayer extends StatefulWidget {
  final String youtubeUrl;
  final String videoTitle;

  const DuaaVideoPlayer({
    super.key,
    required this.youtubeUrl,
    required this.videoTitle,
  });

  @override
  State<DuaaVideoPlayer> createState() => _DuaaVideoPlayerState();
}

class _DuaaVideoPlayerState extends State<DuaaVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    try {
      final yt = YoutubeExplode();
      final videoId = VideoId(widget.youtubeUrl);
      final manifest = await yt.videos.streamsClient.getManifest(videoId);
      final streamInfo = manifest.muxed.withHighestBitrate();
      final streamUrl = streamInfo.url.toString();

      _videoPlayerController =
          VideoPlayerController.networkUrl(Uri.parse(streamUrl));
      await _videoPlayerController.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: false,
        looping: false,
      );

      setState(() {
        _isLoading = false;
      });

      yt.close();
    } catch (e) {
      setState(() {
        _error = 'Failed to load video: $e';
      });
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return Center(
          child: Text(_error!, style: const TextStyle(color: Colors.red)));
    }

    if (_isLoading || _chewieController == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        AspectRatio(
          aspectRatio: _videoPlayerController.value.aspectRatio,
          child: Chewie(controller: _chewieController!),
        ),
        const SizedBox(height: 12),
        const Text("العنوان: كيفية رمي الجمرات",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
