import 'package:flame/components.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';

void main() async {
  runApp(GameWidget(game: MyGame()));
}

enum Direction { down, up }

class MyGame extends BaseGame with DoubleTapDetector {
  SpriteComponent ninjaGirl = SpriteComponent();
  bool running = true;
  Direction direction = Direction.down;
  double SPEED = 4;
  SpriteAnimationComponent ninjaGirlAnimation = SpriteAnimationComponent();
  @override
  Future<void> onLoad() async {
    ninjaGirl
      ..sprite = await loadSprite('Glide_000.png')
      ..size = Vector2(100.0, 100.0)
      ..x = 150
      ..y = 50;

    // add(ninjaGirl);

    var spriteSheet = await images.load('ninja_girl_glide.png');
    final spriteSize = Vector2(152 * 1, 142 * 1);
    SpriteAnimationData spriteData =
        SpriteAnimationData.sequenced(amount: 10, stepTime: 0.1, textureSize: Vector2(505, 474));
    ninjaGirlAnimation = SpriteAnimationComponent.fromFrameData(spriteSheet, spriteData)
      ..x = 150
      ..y = 30
      ..size = spriteSize;
    add(ninjaGirlAnimation);
  }

  @override
  void update(double dt) {
    super.update(dt);
    switch (direction) {
      case Direction.down:
        ninjaGirlAnimation.y += SPEED;
        break;
      case Direction.up:
        ninjaGirlAnimation.y -= SPEED;
        break;
    }
    if (ninjaGirlAnimation.y > 400) {
      direction = Direction.up;
    }
    if (ninjaGirlAnimation.y < 10) {
      direction = Direction.down;
    }
  }

  @override
  void onDoubleTap() {
    if (running) {
      pauseEngine();
    } else {
      resumeEngine();
    }
    running = !running;
  }
}
