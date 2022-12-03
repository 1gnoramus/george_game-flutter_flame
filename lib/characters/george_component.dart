import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame/sprite.dart';

import '../main.dart';

class GeorgeComponent extends SpriteAnimationComponent
    with GestureHitboxes, CollisionCallbacks, HasGameRef {
  GeorgeComponent({required this.game}) {
    add(RectangleHitbox(size: Vector2.all(0.75)));
  }
  final MyGeorgeGame game;
  late SpriteAnimation downAnimation;
  late SpriteAnimation upAnimation;
  late SpriteAnimation rightAnimation;
  late SpriteAnimation leftAnimation;
  late SpriteAnimation idleAnimation;
  final double animationSpeed = .1;

  @override
  Future<void> onLoad() async {
    final spriteSheet = SpriteSheet(
        image: await game.images.load('george.png'), srcSize: Vector2(48, 48));

    downAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: animationSpeed, to: 4);
    leftAnimation =
        spriteSheet.createAnimation(row: 1, stepTime: animationSpeed, to: 4);
    upAnimation =
        spriteSheet.createAnimation(row: 2, stepTime: animationSpeed, to: 4);
    rightAnimation =
        spriteSheet.createAnimation(row: 3, stepTime: animationSpeed, to: 4);
    idleAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: animationSpeed, to: 1);
    animation = idleAnimation;
  }

  @override
  void update(double dt) {
    super.update(dt);
    switch (game.directions) {
      case 0:
        animation = idleAnimation;
        break;
      case 1:
        if (y < game.mapWidth - height) {
          animation = downAnimation;
          y += dt * game.characterSpeed;
        }
        break;
      case 2:
        if (x > 0) {
          animation = leftAnimation;
          x -= dt * game.characterSpeed;
        }
        break;
      case 3:
        if (y > 0) {
          animation = upAnimation;
          y -= dt * game.characterSpeed;
        }

        break;
      case 4:
        if (x < game.mapHeight - width) {
          animation = rightAnimation;
          x += dt * game.characterSpeed;
        }
        break;
    }
  }
}
