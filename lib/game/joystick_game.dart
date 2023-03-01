import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '/components/joystick_player.dart';
import '/constants/constants.dart';

/// Game class to handle Joystick and move some components in the screen
class JoystickGame extends FlameGame with HasDraggables {
  /// PLayer to handle with [joystick]
  late final JoystickPlayer player;

  /// Joystick component
  late final JoystickComponent joystick;

  @override
  Future<void>? onLoad() async {
    await super.onLoad();

    // Create the Joystick component
    const knobRadius = 15.0;
    final knobPaint = BasicPalette.green.withAlpha(200).paint();
    final bgPaint = BasicPalette.green.withAlpha(100).paint();
    joystick = JoystickComponent(
      knob: CircleComponent(radius: knobRadius, paint: knobPaint),
      background: CircleComponent(radius: knobRadius * 3, paint: bgPaint),
      margin: _setJoyStickPosition(JoystickDirectionType.leftHanded),
    );
    // Create player to the game
    player = JoystickPlayer(joystick);

    // Add player and joystick to the game
    addAll([player, joystick]);
  }

  // Set joystick position on the screen based on handed of user
  EdgeInsets _setJoyStickPosition(JoystickDirectionType handedPlayer) {
    // Default bottom margin
    const bottomMargin = 20.0;

    switch (handedPlayer) {
      case JoystickDirectionType.leftHanded:
        return EdgeInsets.only(
          bottom: bottomMargin,
          left: JoystickDirectionType.leftHanded.leftMargin,
        );
      case JoystickDirectionType.rightHanded:
        return EdgeInsets.only(
          bottom: bottomMargin,
          right: JoystickDirectionType.rightHanded.rightMargin,
        );
    }
  }
}
