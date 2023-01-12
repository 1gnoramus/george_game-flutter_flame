import 'package:flutter/cupertino.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:george_game_flame/my_george_game.dart';

class DialogOverlay extends StatefulWidget {
  const DialogOverlay({required this.game});

  final MyGeorgeGame game;

  @override
  State<DialogOverlay> createState() => _DialogOverlayState();
}

class _DialogOverlayState extends State<DialogOverlay> {
  @override
  Widget build(BuildContext context) {
    return widget.game.showDialog
        ? Container(
            color: const Color.fromARGB(167, 218, 218, 218),
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  widget.game.dialogMessage,
                  textStyle: const TextStyle(fontSize: 28, fontFamily: 'vt323'),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              isRepeatingAnimation: false,
              onFinished: () {
                setState(() {
                  widget.game.showDialog = false;
                });
                print('dialog is over');
              },
            ),
          )
        : Container();
  }
}
