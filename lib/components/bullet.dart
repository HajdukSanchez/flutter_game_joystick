import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

import '/game/joystick_game.dart';
import '/constants/audio_constants.dart';

/// Class that represent a bullet shooting by spaceship each time
/// user touch the screen (outside from the joystick component)
class Bullet extends PositionComponent with HasGameRef<JoystickGame> {
  // Default color of the bullet
  static final _bulletColor = Paint()..color = Colors.white;
  // Default bullet speed on shoot
  static const _bulletSpeed = 150.0;
  // Final velocity of the bullet
  late Vector2 _bulletVelocity;

  /// Constructor
  Bullet(this.bulletPosition, this.velocity);

  // Initial position of the bullet
  final Vector2 bulletPosition;
  // Velocity of the bullet
  final Vector2 velocity;

  @override
  Future<void>? onLoad() async {
    await super.onLoad();

    // Set bullet size
    size = Vector2.all(4);
    // Set logical anchor
    anchor = Anchor.center;
    // Set initial position of the bullet
    position = bulletPosition;
    // [velocity] is a unit, so we need to make it account for the actual speed
    // Change length of the vector without changing direction
    _bulletVelocity = (velocity)..scaleTo(_bulletSpeed);

    _bulletShooting();
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    // Make sure each time frame changes, bullet is painting properly on screen
    canvas.drawRect(size.toRect(), _bulletColor);
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Move bullet
    position.add(_bulletVelocity * dt);
  }

  // Play bullet shoot and fly audio on the screen
  void _bulletShooting() {
    FlameAudio.play(AudioConstants.shipShootAudio);
    FlameAudio.play(AudioConstants.bulletFlyAudio);
    FlameAudio.play(AudioConstants.bulletShootAudio);
  }
}
