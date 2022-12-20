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
        var egg = BakedGoodComponent()
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..height = bakedGood.height
          ..debugMode = true
          ..sprite = await game.loadSprite('egg.png');
        game.add(egg);
        game.componentList.add(egg);

        break;
      case 'Fries':
        var fries = BakedGoodComponent()
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..height = bakedGood.height
          ..debugMode = true
          ..sprite = await game.loadSprite('fries.png');
        game.add(fries);
        game.componentList.add(fries);
        break;
      case 'Taco':
        var taco = BakedGoodComponent()
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..height = bakedGood.height
          ..debugMode = true
          ..sprite = await game.loadSprite('taco.png');
        game.add(taco);
        game.componentList.add(taco);
        break;
      case 'Bread':
        var bread = BakedGoodComponent()
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..height = bakedGood.height
          ..debugMode = true
          ..sprite = await game.loadSprite('bread.png');
        game.add(bread);
        game.componentList.add(bread);
        break;
    }
  }
}
