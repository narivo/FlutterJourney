import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  Future<void> playSound(int track) async {
    if (track < 8 && track > 0) {
      final player = AudioPlayer();
      await player.play(AssetSource('note$track.wav'));
    }
  }

  Widget buildKey(int soundTrack, MaterialColor color) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.all(0.0)),
        onPressed: () async {
          await playSound(soundTrack);
        },
        child: Container(
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              buildKey(1, Colors.red),
              buildKey(2, Colors.orange),
              buildKey(3, Colors.yellow),
              buildKey(4, Colors.green),
              buildKey(5, Colors.teal),
              buildKey(6, Colors.blue),
              buildKey(7, Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
