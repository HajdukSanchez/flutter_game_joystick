import 'package:flame/components.dart';

import '/game/joystick_game.dart';
import '/constants/image_constants.dart';

/// Player to be controlled using a joystick component
class JoystickPlayer extends SpriteComponent with HasGameRef<JoystickGame> {
  // Maximum speed of the player to move
  final double _maxSpeed = 300.0;

  /// Constructor
  JoystickPlayer(this.joystick);

  /// Joystick to control this component
  final JoystickComponent joystick;

  @override
  Future<void>? onLoad() async {
    await super.onLoad();

    // Handle sprite anchor
    anchor = Anchor.center;
    // Load component image
    sprite = await gameRef.loadSprite(ImageConstants.shipSprite);
    // Set sprite position in the middle of the game screen
    position = gameRef.size / 2;
    // Set sprite size
    size = Vector2.all(50);
  }

  @override
  void update(double dt) {
    super.update(dt);

    // If joystick is moving
    if (!joystick.delta.isZero()) {
      // Move the ship in the direction that joystick
      // indicates with specific speed
      position.add(joystick.relativeDelta * _maxSpeed * dt);
      // Move the ship in the angle that joystick is oriented at this point
      // Give user the impression that joystick handle angle of movement
      angle = joystick.delta.screenAngle();
    }
  }
}
