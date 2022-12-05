// ignore_for_file: unnecessary_this, avoid_print

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';

import '../main.dart';

class FriendComponent extends PositionComponent
    with GestureHitboxes, CollisionCallbacks, Notifier {
  FriendComponent({required this.game}) {
    add(RectangleHitbox());
  }
  final MyGeorgeGame game;

  @override
  void onCollision(Set<Vector2> points, PositionComponent other) {
    game.friendNumber++;
    game.notifyListeners();
    game.cheer.start();
    print('${game.friendNumber}');
    this.removeFromParent();
    super.onCollision(points, other);
  }
}
