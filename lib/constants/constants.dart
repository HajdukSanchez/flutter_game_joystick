/// Enum with direction Joystick can be handle
///
/// Left handed or right handle people
enum JoystickDirectionType {
  /// Left handed people needs joystick at the left
  /// side of the screen
  leftHanded(20, 0),

  /// Right handed people needs joystick at the right
  /// side of the screen
  rightHanded(0, 20);

  /// Constructor
  const JoystickDirectionType(this.leftMargin, this.rightMargin);

  /// Left margin space
  final double leftMargin;

  /// Right margin space
  final double rightMargin;
}
