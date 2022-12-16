import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:george_game_flame/characters/george_component.dart';
import '../my_george_game.dart';

class ObstacleComponent extends PositionComponent
    with CollisionCallbacks, GestureHitboxes {
  ObstacleComponent({required this.game}) {
    add(RectangleHitbox());
  }
  final MyGeorgeGame game;
  bool _hasCollided = false;

  @override
  void onCollision(Set<Vector2> points, PositionComponent other) {
    if (other is GeorgeComponent) {
      if (!_hasCollided) {
        game.collisionDirection = game.directions;
        _hasCollided = true;
      }
    }
    super.onCollision(points, other);
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    if (other is GeorgeComponent) {
      game.collisionDirection = -1;
      _hasCollided = false;
    }
    super.onCollisionEnd(other);
  }
}
