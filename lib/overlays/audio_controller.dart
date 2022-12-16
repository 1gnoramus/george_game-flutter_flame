import 'package:flutter/material.dart';
import 'package:flame_audio/flame_audio.dart';

class AudioOverlay extends StatelessWidget {
  const AudioOverlay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          height: 80.0,
        ),
        Container(
          color: const Color(0x8F37474f),
          child: IconButton(
            icon: const Icon(Icons.volume_up_rounded),
            color: Colors.pink.shade200,
            onPressed: () {
              FlameAudio.bgm.play('cute.mp3');
            },
          ),
        ),
        Container(
          color: const Color(0x8F37474f),
          child: IconButton(
            icon: const Icon(Icons.volume_off_rounded),
            color: Colors.pink.shade200,
            onPressed: () {
              FlameAudio.bgm.stop();
            },
          ),
        ),
      ],
    );
  }
}
