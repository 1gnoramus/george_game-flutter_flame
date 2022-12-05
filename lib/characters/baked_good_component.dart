import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../main.dart';

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
    gameRef.bakedGoodsInventory++;
    gameRef.yummy.start();
    gameRef.overlays;
    gameRef.notifyListeners;
    print('${gameRef.bakedGoodsInventory}');
    this.removeFromParent();
  }
}
