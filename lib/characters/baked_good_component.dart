import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';

import '../main.dart';

class BakedGoodComponent extends SpriteComponent
    with
        GestureHitboxes,
        CollisionCallbacks,
        Notifier,
        HasGameRef<MyGeorgeGame> {
  BakedGoodComponent() {
    add(RectangleHitbox(size: Vector2.all(2)));
    debugMode = true;
  }

  @override
  void onCollision(Set<Vector2> points, PositionComponent other) {
    gameRef.bakedGoodsInventory++;
    print('${gameRef.bakedGoodsInventory}');
    this.removeFromParent();
  }
}
