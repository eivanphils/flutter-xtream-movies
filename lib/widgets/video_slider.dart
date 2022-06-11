import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoSlider extends StatelessWidget {
  final String youtubeId;
  const VideoSlider({Key? key, required this.youtubeId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('Trailers',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return _YoutubeVideo(youtubeId: youtubeId);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class _YoutubeVideo extends StatefulWidget {
  final String youtubeId;

  const _YoutubeVideo({Key? key, required this.youtubeId}) : super(key: key);

  @override
  State<_YoutubeVideo> createState() => _YoutubeVideoState();
}

class _YoutubeVideoState extends State<_YoutubeVideo> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.youtubeId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        disableDragSeek: true
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 200,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressColors: const ProgressBarColors(
              playedColor: Colors.amber,
              handleColor: Colors.amberAccent,
            ),
          ),
        ),
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      ),
    );
  }
}
