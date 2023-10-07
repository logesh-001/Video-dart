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
    final double cardWidth = 400;
    final double cardHeight = cardWidth / customAspectRatio;

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: cardWidth,
              height: cardHeight,
              margin: EdgeInsets.only(left: 6, top: 4, right: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: InteractiveViewer(
                minScale: 0.1,
                maxScale: 12.0,
                child: AspectRatio(
                  aspectRatio: customAspectRatio,
                  child: CustomVideoPlayer(
                    customVideoPlayerController: _customVideoPlayerController,
                  ),
                ),
              ),
            ),
          ],
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

void main() {
  runApp(
    MaterialApp(
      home: VideoPlayerPage(),
    ),
  );
}















// import 'package:appinio_video_player/appinio_video_player.dart';
// import 'package:flutter/material.dart';

// enum Source { Asset, Network }

// class VideoPlayerPage extends StatefulWidget {
//   const VideoPlayerPage({Key? key}) : super(key: key);

//   @override
//   State<VideoPlayerPage> createState() => _VideoPlayerPageState();
// }

// class _VideoPlayerPageState extends State<VideoPlayerPage> {
//   late CustomVideoPlayerController _customVideoPlayerController;

//   Source currentSource = Source.Asset;
//   Uri videoUrl = Uri.parse(
//       "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4");

//   String assetVideoPath = "assets/videos/video.mp4";

//   @override
//   void initState() {
//     super.initState();
//     initializeVideoPlayer(currentSource);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double customAspectRatio = 4 / 3;

//     // Define the fixed card size
//     final double cardWidth = 400;
//     final double cardHeight = cardWidth / customAspectRatio;

//     return SafeArea(
//       child: Scaffold(
//         body: Center(
//           child: Container(
//             width: cardWidth, // Set the fixed card width
//             height: cardHeight, // Set the fixed card height
//             child: InteractiveViewer(
//               // Add margin for zooming
//               minScale: 0.1, // Minimum zoom level
//               maxScale: 12.0, // Maximum zoom level
//               child: AspectRatio(
//                 aspectRatio:
//                     customAspectRatio, // Set the desired aspect ratio here
//                 child: CustomVideoPlayer(
//                   customVideoPlayerController: _customVideoPlayerController,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         floatingActionButton: _sourceButtons(),
//       ),
//     );
//   }

//   Widget _sourceButtons() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         MaterialButton(
//           onPressed: () {
//             setState(() {
//               currentSource = Source.Network;
//               initializeVideoPlayer(currentSource);
//             });
//           },
//           color: Colors.greenAccent,
//           child: const Text(
//             "Network",
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         MaterialButton(
//           onPressed: () {
//             setState(() {
//               currentSource = Source.Asset;
//               initializeVideoPlayer(currentSource);
//             });
//           },
//           color: Colors.greenAccent,
//           child: const Text(
//             "Asset",
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//       ],
//     );
//   }

//   void initializeVideoPlayer(Source source) {
//     VideoPlayerController _videoPlayerController;
//     if (source == Source.Asset) {
//       _videoPlayerController = VideoPlayerController.asset(assetVideoPath)
//         ..initialize().then((value) {
//           setState(() {});
//         });
//     } else if (source == Source.Network) {
//       _videoPlayerController = VideoPlayerController.networkUrl(videoUrl)
//         ..initialize().then((value) {
//           setState(() {});
//         });
//     } else {
//       return;
//     }

//     _customVideoPlayerController = CustomVideoPlayerController(
//       context: context,
//       videoPlayerController: _videoPlayerController,
//     );
//   }

//   @override
//   void dispose() {
//     _customVideoPlayerController.dispose();
//     super.dispose();
//   }
// }

// void main() {
//   runApp(
//     MaterialApp(
//       home: VideoPlayerPage(),
//     ),
//   );
// }
