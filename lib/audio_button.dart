import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioButton extends StatelessWidget {
  final String audioPath;
  final AudioPlayer audioPlayer = AudioPlayer();
  AudioButton({super.key, required this.audioPath});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
      onPressed: () {
        audioPlayer.play(AssetSource(audioPath));
      },
      child: const Icon(Icons.play_arrow)
    );
  }
}