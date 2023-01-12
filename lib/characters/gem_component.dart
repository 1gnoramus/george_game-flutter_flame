// ignore_for_file: unnecessary_this, avoid_print

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:george_game_flame/dialog/dialog_box.dart';
import '../my_george_game.dart';
import 'george_component.dart';

class GemComponent extends SpriteComponent
    with GestureHitboxes, CollisionCallbacks, Notifier {
  GemComponent({required this.game}) {
    add(RectangleHitbox());
  }
  final MyGeorgeGame game;

  @override
  void onCollision(Set<Vector2> points, PositionComponent other) {
    if (other is GeorgeComponent) {
      game.gemInventory++;
      game.cheer.start();
    }
    this.removeFromParent();
    super.onCollision(points, other);
  }
}
