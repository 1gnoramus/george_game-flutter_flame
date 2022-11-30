import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(game: MyGeorgeGame()));
}

class MyGeorgeGame extends FlameGame with TapDetector {
  late SpriteAnimation downAnimation;
  late SpriteAnimation upAnimation;
  late SpriteAnimation rightAnimation;
  late SpriteAnimation leftAnimation;
  late SpriteAnimation idleAnimation;

  late SpriteAnimationComponent george;
  late SpriteComponent background;

  int directions = 0;
  final double animationSpeed = .1;
  final double characterSize = 100.0;
  final double characterSpeed = 100;

  Future<void> onLoad() async {
    await super.onLoad();

    Sprite backgroundSprite = await loadSprite('bg.png');
    background = SpriteComponent()
      ..sprite = backgroundSprite
      ..size = backgroundSprite.originalSize;
    add(background);

    final spriteSheet = SpriteSheet(
        image: await images.load('george.png'), srcSize: Vector2(48, 48));

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

    george = SpriteAnimationComponent()
      ..animation = idleAnimation
      ..position = Vector2(100, 200)
      ..size = Vector2.all(characterSize);
    add(george);

    camera.followComponent(george,
        worldBounds: Rect.fromLTRB(0, 0, background.size.x, background.size.y));
  }

  @override
  void update(double dt) {
    super.update(dt);
    switch (directions) {
      case 0:
        george.animation = idleAnimation;
        break;
      case 1:
        if (george.y < background.size.y - george.height) {
          george.animation = downAnimation;
          george.y += dt * characterSpeed;
        }
        break;
      case 2:
        if (george.x > 0) {
          george.animation = leftAnimation;
          george.x -= dt * characterSpeed;
        }
        break;
      case 3:
        if (george.y > 0) {
          george.animation = upAnimation;
          george.y -= dt * characterSpeed;
        }

        break;
      case 4:
        if (george.x < background.size.x - george.width) {
          george.animation = rightAnimation;
          george.x += dt * characterSpeed;
        }
        break;
    }
  }

  @override
  void onTapUp(TapUpInfo info) {
    directions += 1;
    if (directions > 4) {
      directions = 0;
    }
  }
}
