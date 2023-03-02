import 'package:flame/components.dart';

class Utils {
  // Validate if some component is go out of the screen boundaries
  static bool componentIsOutBoundaries({
    required PositionComponent component,
    required Vector2 size,
  }) {
    if (component.position.x > size.x ||
        component.position.x < 0 ||
        component.position.y > size.y ||
        component.position.y < 0) {
      return true;
    }
    return false;
  }
}
