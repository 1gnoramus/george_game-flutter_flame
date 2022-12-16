import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:george_game_flame/characters/george_component.dart';

import '../main.dart';
import '../my_george_game.dart';

class BakedGoodComponent extends SpriteComponent
    with
        GestureHitboxes,
        CollisionCallbacks,
        Notifier,
        HasGameRef<MyGeorgeGame> {
  BakedGoodComponent() {
    add(RectangleHitbox());
    debugMode = true;
  }

  @override
  void onCollision(Set<Vector2> points, PositionComponent other) {
    if (other is GeorgeComponent) {
      removeFromParent();
      gameRef.bakedGoodsInventory++;

      gameRef.yummy.start();
      print('${gameRef.bakedGoodsInventory}');
    }
  }
}
