import 'package:flutter/material.dart';
import '../my_george_game.dart';

class ScoreOverlay extends StatelessWidget {
  const ScoreOverlay({
    Key? key,
    required this.game,
  }) : super(key: key);

  final MyGeorgeGame game;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: const Color.fromARGB(167, 218, 218, 218),
          child: Image.asset(
            'assets/images/friend.png',
            scale: .7,
          ),
        ),
        const SizedBox(width: 12.0),
        Container(
          color: const Color.fromARGB(167, 218, 218, 218),
          child: Text(
            '${game.friendNumber}',
            style: TextStyle(fontSize: 28.0, color: Colors.black45),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          color: const Color.fromARGB(167, 218, 218, 218),
          child: Image.asset(
            'assets/images/egg.png',
            scale: .7,
          ),
        ),
        const SizedBox(width: 12.0),
        Container(
          color: const Color.fromARGB(167, 218, 218, 218),
          child: Text(
            '${game.bakedGoodsInventory}',
            style: TextStyle(fontSize: 28.0, color: Colors.black45),
          ),
        ),
      ],
    );
  }
}
