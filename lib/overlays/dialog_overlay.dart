import 'package:flutter/cupertino.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:george_game_flame/my_george_game.dart';

class DialogOverlay extends StatelessWidget {
  const DialogOverlay({required this.game});

  final MyGeorgeGame game;

  @override
  Widget build(BuildContext context) {
    return game.showDialog
        ? Container(
            color: const Color.fromARGB(167, 218, 218, 218),
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  game.dialogMessage,
                  textStyle: const TextStyle(fontSize: 18),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              isRepeatingAnimation: false,
              onFinished: () {
                game.showDialog = false;
                print('dialog is over');
              },
            ),
          )
        : Container();
  }
}
