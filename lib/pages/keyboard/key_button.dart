import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quick_ide/pages/keyboard/type_controller.dart';

class KeyButton extends StatelessWidget {
  const KeyButton({
    super.key,
    required this.text,
    required this.typeController,
    this.flex = 1,
  });

  final String text;
  final TypeController typeController;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          color: Colors.blue.shade300,
          child: InkWell(
            onTap: () {
              HapticFeedback.lightImpact();
              if (text == 'bs') {
                typeController.backspace();
                return;
              }
              typeController.typeText(text);
            },
            child: Center(child: Text(text)),
          ),
        ),
      ),
    );
  }
}
