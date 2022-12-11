// ignore_for_file: unnecessary_this, avoid_print

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:george_game_flame/dialog/dialog_box.dart';

import '../main.dart';

class FriendComponent extends PositionComponent
    with GestureHitboxes, CollisionCallbacks, Notifier {
  FriendComponent({required this.game}) {
    add(RectangleHitbox());
  }
  final MyGeorgeGame game;

  @override
  void onCollision(Set<Vector2> points, PositionComponent other) {
    var message = '';
    if (game.bakedGoodsInventory > 0) {
      message = 'Wow. I am amazed' ' Marry my daughter ' 'or something';
      game.friendNumber++;
      game.cheer.start();

      game.bakedGoodsInventory--;
      this.removeFromParent();
    } else {
      message = 'Fuck off. Where is my fucking pie< bitch?';
    }
    game.dialogBox = DialogBox(text: message, game: game);
    game.add(game.dialogBox);

    super.onCollision(points, other);
  }
}
