import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/audio_pool.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/material.dart';
import 'package:george_game_flame/dialog/dialog_box.dart';
import 'package:george_game_flame/loaders/load_friends.dart';
import 'package:george_game_flame/loaders/load_obstacles.dart';
import 'package:flame/input.dart';
import 'characters/george_component.dart';
import 'loaders/add_baked_good.dart';

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
  int maxFriends = 0;
  int bakedGoodsInventory = 0;
  int sceneNumber = 1;
  late TiledComponent homeMap;

  List<Component> componentList = [];

  late AudioPool yummy;
  late AudioPool cheer;
  // late DialogBox dialogBox;
  bool showDialog = true;

  String dialogMessage = 'Hi. I am George. I have just'
      ' moved to Happy Big Village';

  Future<void> onLoad() async {
    await super.onLoad();

    // final homeMap = await TiledComponent.load('happy_map.tmx', Vector2.all(16));
    homeMap = await TiledComponent.load('map.tmx', Vector2.all(16));

    add(homeMap);

    mapWidth = homeMap.tileMap.map.width * 16.0;
    mapHeight = homeMap.tileMap.map.height * 16.0;

    addBakedGoods(homeMap, this);
    loadFriends(homeMap, this);
    loadObstacles(homeMap, this);

    yummy = await AudioPool.create('audio/sfx/yummy.mp3', maxPlayers: 1);
    cheer = await AudioPool.create('audio/sfx/cheer_2.mp3', maxPlayers: 1);

    FlameAudio.bgm.initialize();
    FlameAudio.audioCache.load('cute.mp3');
    // FlameAudio.bgm.play('cute.mp3');
    overlays.add('ButtonController');

    george = GeorgeComponent(game: this)
      ..position = Vector2(529, 128)
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

  void newScene() async {
    String mapFile = 'happy_map/tmx';
    remove(homeMap);
    bakedGoodsInventory = 0;
    friendNumber = 0;
    maxFriends = 0;
    FlameAudio.bgm.stop();
    removeAll(componentList);
    componentList = [];
    showDialog = false;
    remove(george);
    george = GeorgeComponent(game: this)
      ..position = Vector2(300, 129)
      ..debugMode = true
      ..size = Vector2.all(characterSize);
    if (sceneNumber == 2) {
      print('2');
    } else if (sceneNumber == 3) {
      print('3');
      mapFile = 'map.tmx';
    }

    homeMap = await TiledComponent.load(mapFile, Vector2.all(16));
    add(homeMap);

    mapWidth = homeMap.tileMap.map.width * 16;
    mapHeight = homeMap.tileMap.map.height * 16;
    addBakedGoods(homeMap, this);
    loadFriends(homeMap, this);
    loadObstacles(homeMap, this);
    add(george);
    camera.followComponent(george,
        worldBounds: Rect.fromLTRB(0, 0, mapWidth, mapHeight));
  }
}
