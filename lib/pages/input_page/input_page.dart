import 'dart:io';

import 'package:flutter/material.dart';

import '../keyboard/keyboard.dart';
import '../keyboard/rich_text_controller.dart';

class InputPage extends StatelessWidget with WidgetsBindingObserver {
  String text;
  File file;
  InputPage({required this.text, required this.file});
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print(state);
  }

  TextEditingController controller = RichTextController(
    stringMatchMap: {
      'class': const TextStyle(color: Colors.yellow),
      'while': const TextStyle(color: Colors.blue),
    },
    onMatch: ((match) {
      print(match);
      return '*';
    }),
  );
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    controller.text = text;
    return WillPopScope(
      onWillPop: () async {
        await file.writeAsString(controller.text);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.golf_course),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 7,
              child: Scrollbar(
                controller: scrollController,
                thumbVisibility: true,
                child: TextField(
                  controller: controller,
                  scrollController: scrollController,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.left,
                  textAlignVertical: TextAlignVertical.top,
                  autofocus: true,
                  maxLines: null,
                  minLines: null,
                  expands: true,
                  showCursor: true,
                  readOnly: true,
                ),
              ),
            ),
            Expanded(flex: 4, child: SizedBox(child: Keyboard(controller)))
          ],
        ),
      ),
    );
  }
}
