import 'package:flutter/material.dart';
import 'package:george_game_flame/main.dart';
import 'package:flame/flame.dart';
import 'package:flame_audio/flame_audio.dart';

class ButtonController extends StatelessWidget {
  const ButtonController({Key? key, required this.game});
  final MyGeorgeGame game;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const SizedBox(
              height: 80.0,
            ),
            IconButton(
              icon: const Icon(Icons.volume_up_rounded),
              color: Colors.pink.shade200,
              onPressed: () {
                FlameAudio.bgm.play('cute.mp3');
              },
            ),
            IconButton(
              icon: const Icon(Icons.volume_off_rounded),
              color: Colors.pink.shade200,
              onPressed: () {
                FlameAudio.bgm.stop();
              },
            ),
            Text(
              game.soundTrackName,
              style: TextStyle(color: Colors.pink.shade200, fontSize: 20),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Image.asset(
                'assets/images/friend.png',
                scale: .7,
              ),
              const SizedBox(width: 12.0),
              Text(
                '${game.friendNumber}',
                style: TextStyle(fontSize: 28.0, color: Colors.black45),
              )
            ],
          ),
        )
      ],
    );
  }
}
