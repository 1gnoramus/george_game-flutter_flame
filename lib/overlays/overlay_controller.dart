import 'package:flutter/material.dart';
import 'package:george_game_flame/overlays/dialog_overlay.dart';
import 'package:george_game_flame/overlays/score_overlay.dart';
import '../my_george_game.dart';
import 'audio_controller.dart';

class OverlayController extends StatelessWidget {
  const OverlayController({Key? key, required this.game});
  final MyGeorgeGame game;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const AudioOverlay(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(flex: 2, child: ScoreOverlay(game: game)),
              const Expanded(flex: 2, child: DialogOverlay()),
            ],
          ),
        )
      ],
    );
  }
}
