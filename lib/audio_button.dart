import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioButton extends StatelessWidget {
  final String audioPath;
  static AudioPlayer audioPlayer = AudioPlayer();
  const AudioButton({super.key, required this.audioPath});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20),
            backgroundColor: const Color.fromRGBO(255, 255, 255, 0.2)),
        onPressed: () {
          audioPlayer.play(AssetSource(audioPath));
        },
        child: const Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [Icon(Icons.sensors), Text("導覽語音")]));
  }
}
