import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flame_audio/audio_pool.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/material.dart';
import 'package:george_game_flame/dialog/dialog_box.dart';
import 'package:george_game_flame/loaders/load_friends.dart';
import 'package:george_game_flame/loaders/load_obstacles.dart';
import 'button_controller.dart';
import 'package:flame/geometry.dart';
import 'package:flame/input.dart';
import 'characters/baked_good_component.dart';
import 'characters/friend_component.dart';
import 'characters/george_component.dart';
import 'loaders/add_baked_good.dart';

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

class MyGeorgeGame extends FlameGame
    with TapDetector, HasCollisionDetection, Notifier {
  late GeorgeComponent george;
  late double mapWidth;
  late double mapHeight;

  int directions = 0;
  int collisionDirection = -1;
  String soundTrackName = 'Cute Music';
  final double characterSize = 70;
  final double characterSpeed = 150;
  int friendNumber = 0;
  int bakedGoodsInventory = 0;

  late AudioPool yummy;
  late AudioPool cheer;
  late DialogBox dialogBox;

  Future<void> onLoad() async {
    await super.onLoad();

    // final homeMap = await TiledComponent.load('happy_map.tmx', Vector2.all(16));
    final homeMap = await TiledComponent.load('map.tmx', Vector2.all(16));

    add(homeMap);

    mapWidth = homeMap.tileMap.map.width * 16.0;
    mapHeight = homeMap.tileMap.map.height * 16.0;

    addBakedGoods(homeMap, this);
    loadFriends(homeMap, this);
    loadObstacles(homeMap, this);

    yummy = await AudioPool.create('audio/sfx/yummy.mp3', maxPlayers: 1);
    cheer = await AudioPool.create('audio/sfx/cheer_2.mp3', maxPlayers: 1);

    dialogBox = DialogBox(
        text: 'Hi. I am George. I have just'
            ' moved to Happy Big Village'
            ' I. Want. To. Make. Some. Frriiiiienndds)0',
        game: this);
    add(dialogBox);

    FlameAudio.bgm.initialize();
    FlameAudio.audioCache.load('cute.mp3');
    // FlameAudio.bgm.play('cute.mp3');
    overlays.add('ButtonController');

    george = GeorgeComponent(game: this)
      ..position = Vector2(50, 50)
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
  void onTapUp(TapUpInfo info) {
    directions += 1;
    if (directions > 4) {
      directions = 0;
    }
  }
}
