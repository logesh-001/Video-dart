import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({Key? key}) : super(key: key);

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late CustomVideoPlayerController _customVideoPlayerController;

  Uri videoUrl = Uri.parse(
      "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4");

  String assetVideoPath = "assets/videos/video.mp4";

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
  }

  @override
  Widget build(BuildContext context) {
    final double customAspectRatio = 16 / 9;

    // Define the fixed card size
    final double cardWidth = 340;
    final double cardHeight = cardWidth / customAspectRatio;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 60.0,
              ),
              ClipRRect(
                // Wrap the card in ClipRRect
                borderRadius:
                    BorderRadius.circular(20), // Set the border radius
                child: Container(
                  width: cardWidth,
                  height: cardHeight,
                  child: Stack(
                    children: [
                      InteractiveViewer(
                        minScale: 0.1,
                        maxScale: 12.0,
                        child: AspectRatio(
                          aspectRatio: customAspectRatio,
                          child: CustomVideoPlayer(
                            customVideoPlayerController:
                                _customVideoPlayerController,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10.0, // Adjust the top positioning as needed
                        right: 10.0, // Adjust the right positioning as needed
                        child: IconButton(
                          icon: Icon(Icons.settings),
                          onPressed: () {
                            // Add your settings button functionality here
                            // For example, show a settings dialog
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void initializeVideoPlayer() {
    VideoPlayerController _videoPlayerController =
        VideoPlayerController.asset(assetVideoPath)
          ..initialize().then((value) {
            setState(() {});
          });

    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _videoPlayerController,
    );
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }
}
