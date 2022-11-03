import 'package:flutter/material.dart';
import 'package:quick_ide/pages/keyboard/type_controller.dart';

class KeyButton extends StatelessWidget {
  KeyButton({
    super.key,
    required this.text,
    required this.typeController,
    this.flex = 1,
  });

  final String text;
  final TypeController typeController;
  final int flex;

  bool isPressed = false;
  int deleteSpeed = 200;
  void onTapDown() {
    isPressed = true;
    deleteSpeed = 200;
    if (text == 'bs') {
      Future.delayed(const Duration(milliseconds: 700)).then((value) async {
        while (isPressed) {
          typeController.backspace();
          await Future.delayed(Duration(milliseconds: deleteSpeed > 50 ? deleteSpeed -= 2 : deleteSpeed));
        }
      });
    }
  }

  void onTapUp() {
    isPressed = false;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          color: Colors.blue.shade300,
          child: Listener(
            onPointerDown: ((event) => onTapDown()),
            onPointerUp: (event) => onTapUp(),
            onPointerCancel: (event) => onTapUp(),
            child: InkWell(
              onTap: () {
                if (text == 'bs') {
                  typeController.backspace();
                  return;
                } else if (text == 'Tab') {
                  typeController.typeText('    ');
                  return;
                }
                typeController.typeText(text);
              },
              onLongPress: () {
                if (text == 'bs') {
                  typeController.backspace();
                  return;
                } else if (text == 'Tab') {
                  typeController.typeText('    ');
                  return;
                }
                typeController.typeText(text.toUpperCase());
              },
              child: Center(child: Text(text)),
            ),
          ),
        ),
      ),
    );
  }
}
