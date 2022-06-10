import 'package:flutter/material.dart';

class VideoSlider extends StatelessWidget {
  final String youtubeId;
  const VideoSlider({
    Key? key,
    required this.youtubeId
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
              'Trailer',
              style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold)
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return  const _YoutubeVideo();
              }
            ),
          ),
        ],
      ),
    );
  }
}

class _YoutubeVideo extends StatelessWidget {
  const _YoutubeVideo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 100,
      color: Colors.red,
      child: Text('video de youtube'),
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
    );
  }
}
