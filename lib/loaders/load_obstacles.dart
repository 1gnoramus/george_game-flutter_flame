import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:george_game_flame/characters/obstacle_component.dart';
import 'package:george_game_flame/main.dart';

import '../my_george_game.dart';

void loadObstacles(TiledComponent homeMap, MyGeorgeGame game) {
  final obstacleGroup = homeMap.tileMap.getLayer<ObjectGroup>('Obstacles');

  for (var obstacleBox in obstacleGroup!.objects) {
    var obstacleComponent = ObstacleComponent(game: game)
      ..position = Vector2(obstacleBox.x, obstacleBox.y)
      ..width = obstacleBox.width
      ..height = obstacleBox.height
      ..debugMode = true;
    game.add(obstacleComponent);
    game.componentList.add(obstacleComponent);
  }
}
