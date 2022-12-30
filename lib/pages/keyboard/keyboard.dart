import 'package:flutter/material.dart';
import 'package:quick_ide/pages/keyboard/key_button.dart';
import 'package:quick_ide/pages/keyboard/type_controller.dart';

// const List<String> line7 = ['+', '-', '*', '/', ':', '.', '=', '&', '|', 'bs'];
// const List<String> line6 = ['Tab', '!', '"', '#', '\$', '%', "'", '~', '^', '?'];
// const List<String> line5 = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];
const List<String> line4 = ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'];
const List<String> line3 = ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', '\n'];
const List<String> line2 = ['(', 'z', 'x', 'c', 'v', 'b', 'n', 'm', ')', ','];
const List<String> line1 = ['{', '[', '<', '_', ' ', ';', '>', ']', '}'];

class Keyboard extends StatelessWidget {
  Keyboard(this.textEditingController);

  TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    TypeController typeController = TypeController(textEditingController);
    return Container(
      height: 160,
      color: const Color.fromARGB(255, 114, 109, 109),
      child: Column(
        children: [
          // Expanded(
          //   child: Row(
          //     children: line7.map((e) => KeyButton(text: e, typeController: typeController)).toList(),
          //   ),
          // ),
          // Expanded(
          //   child: Row(
          //     children: line6.map((e) => KeyButton(text: e, typeController: typeController)).toList(),
          //   ),
          // ),
          // Expanded(
          //   child: Row(
          //     children: line5.map((e) => KeyButton(text: e, typeController: typeController)).toList(),
          //   ),
          // ),
          Expanded(
            child: Row(
              children: line4.map((e) => KeyButton(text: e, typeController: typeController)).toList(),
            ),
          ),
          Expanded(
            child: Row(
              children: line3.map((e) => KeyButton(text: e, typeController: typeController)).toList(),
            ),
          ),
          Expanded(
            child: Row(
              children: line2.map((e) => KeyButton(text: e, typeController: typeController)).toList(),
            ),
          ),
          Expanded(
            child: Row(
              children: line1.map((e) => KeyButton(text: e, typeController: typeController)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
