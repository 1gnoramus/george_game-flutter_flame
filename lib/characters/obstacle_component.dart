import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../main.dart';

class ObstacleComponent extends PositionComponent
    with CollisionCallbacks, GestureHitboxes {
  ObstacleComponent({required this.game}) {
    add(RectangleHitbox());
  }
  final MyGeorgeGame game;

  @override
  void onCollision(Set<Vector2> points, PositionComponent other) {
    print('obstacle got hit');
    super.onCollision(points, other);
  }
}
