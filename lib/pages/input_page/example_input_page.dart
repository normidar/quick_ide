import 'package:flutter/material.dart';
import 'package:quick_ide/engine/high_light_text_controller/high_light_text_controller.dart';

import '../keyboard/keyboard.dart';

class ExampleInputPage extends StatelessWidget with WidgetsBindingObserver {
  ExampleInputPage();
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print(state);
  }

  TextEditingController controller = HighLightTextController();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    controller.text = 'text';
    return WillPopScope(
      onWillPop: () async {
        // await file.writeAsString(controller.text);
        return true;
      },
      child: Scaffold(
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
