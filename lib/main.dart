import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/material.dart';
import 'button_controller.dart';
import 'package:flame/input.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen;
  runApp(
    MaterialApp(
      home: Scaffold(
        body: GameWidget(
          game: MyGeorgeGame(),
          overlayBuilderMap: {
            'ButtonController': (BuildContext context, MyGeorgeGame game) {
              return ButtonController(
                game: game,
              );
            }
          },
        ),
      ),
    ),
  );
}

class MyGeorgeGame extends FlameGame with TapDetector, CollisionCallbacks {
  late SpriteAnimation downAnimation;
  late SpriteAnimation upAnimation;
  late SpriteAnimation rightAnimation;
  late SpriteAnimation leftAnimation;
  late SpriteAnimation idleAnimation;

  late GeorgeComponent george;
  late double mapWidth;
  late double mapHeight;

  int directions = 0;
  final double animationSpeed = .1;
  final String soundTrackName = 'Cute Music';
  final double characterSize = 100.0;
  final double characterSpeed = 100;

  Future<void> onLoad() async {
    await super.onLoad();

    final homeMap = await TiledComponent.load('map.tmx', Vector2.all(16));
    add(homeMap);

    mapWidth = homeMap.tileMap.map.width * 16.0;
    mapHeight = homeMap.tileMap.map.height * 16.0;

    FlameAudio.bgm.initialize();
    FlameAudio.audioCache.load('cute.mp3');

    overlays.add('ButtonController');

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

    george = GeorgeComponent()
      ..animation = idleAnimation
      ..position = Vector2(100, 200)
      ..debugMode = true
      ..size = Vector2.all(characterSize);
    add(george);

    camera.followComponent(george,
        worldBounds: Rect.fromLTRB(0, 0, mapWidth, mapHeight));
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void update(double dt) {
    super.update(dt);
    switch (directions) {
      case 0:
        george.animation = idleAnimation;
        break;
      case 1:
        if (george.y < mapWidth - george.height) {
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
        if (george.x < mapHeight - george.width) {
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

class FriendComponent extends PositionComponent
    with GestureHitboxes, CollisionCallbacks {
  FriendComponent() {
    add(RectangleHitbox());
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    print('I made a new friend');
    super.onCollisionEnd(other);
  }
}

class GeorgeComponent extends SpriteAnimationComponent
    with GestureHitboxes, CollisionCallbacks {
  GeorgeComponent() {
    add(RectangleHitbox());
  }
}
