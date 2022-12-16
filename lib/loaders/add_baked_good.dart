import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:george_game_flame/main.dart';

import '../characters/baked_good_component.dart';
import '../my_george_game.dart';

void addBakedGoods(TiledComponent homeMap, MyGeorgeGame game) async {
  final bakedGoodsGroup = homeMap.tileMap.getLayer<ObjectGroup>('BakedGoods');

  for (var bakedGood in bakedGoodsGroup!.objects) {
    switch (bakedGood.type) {
      case 'Egg':
        game.add(
          BakedGoodComponent()
            ..position = Vector2(bakedGood.x, bakedGood.y)
            ..width = bakedGood.width
            ..height = bakedGood.height
            ..debugMode = true
            ..sprite = await game.loadSprite('egg.png'),
        );
        break;
      case 'Fries':
        game.add(
          BakedGoodComponent()
            ..position = Vector2(bakedGood.x, bakedGood.y)
            ..width = bakedGood.width
            ..height = bakedGood.height
            ..debugMode = true
            ..sprite = await game.loadSprite('fries.png'),
        );
        break;
      case 'Taco':
        game.add(
          BakedGoodComponent()
            ..position = Vector2(bakedGood.x, bakedGood.y)
            ..width = bakedGood.width
            ..height = bakedGood.height
            ..debugMode = true
            ..sprite = await game.loadSprite('taco.png'),
        );
        break;
      case 'Bread':
        game.add(
          BakedGoodComponent()
            ..position = Vector2(bakedGood.x, bakedGood.y)
            ..width = bakedGood.width
            ..height = bakedGood.height
            ..debugMode = true
            ..sprite = await game.loadSprite('bread.png'),
        );
        break;
    }
  }
}
