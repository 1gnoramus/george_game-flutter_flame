// ignore_for_file: unnecessary_this, avoid_print

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:george_game_flame/dialog/dialog_box.dart';
import '../my_george_game.dart';
import 'george_component.dart';

class FriendComponent extends PositionComponent
    with GestureHitboxes, CollisionCallbacks, Notifier {
  FriendComponent({required this.game}) {
    add(RectangleHitbox());
  }
  final MyGeorgeGame game;

  @override
  void onCollision(Set<Vector2> points, PositionComponent other) {
    var message = '';
    if (other is GeorgeComponent) {
      if (game.bakedGoodsInventory > 0) {
        game.dialogMessage =
            'Wow. I am amazed' ' Marry my daughter ' 'or something';
        game.friendNumber++;
        game.cheer.start();

        game.bakedGoodsInventory--;
        this.removeFromParent();
      } else {
        game.dialogMessage = 'Fuck off. Where is my fucking pie< bitch?';
      }
      game.showDialog = true;
    }

    super.onCollision(points, other);
  }
}
