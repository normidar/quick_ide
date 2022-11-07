import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quick_ide/pages/flutter_eval_page/flutter_eval_page.dart';

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

  static const reservedWordStyle = TextStyle(color: Color.fromARGB(255, 38, 172, 255));

  TextEditingController controller = RichTextController(
    patternMatchMap: {
      RegExp(r"'.*?'"): const TextStyle(color: Color.fromARGB(255, 224, 75, 20)),
      RegExp(r'".*?"'): const TextStyle(color: Color.fromARGB(255, 224, 75, 20)),
      RegExp(r'\bclass\b'): reservedWordStyle,
      RegExp(r'\bwhile\b'): reservedWordStyle,
      RegExp(r'@override\b'): reservedWordStyle,
      RegExp(r'\breturn\b'): reservedWordStyle,
      RegExp(r'\bimport\b'): reservedWordStyle,
      RegExp(r'\bif\b'): reservedWordStyle,
      RegExp(r'\belse\b'): reservedWordStyle,
      RegExp(r'\bfor\b'): reservedWordStyle,
      RegExp(r'\bas\b'): reservedWordStyle,
      RegExp(r'\bfalse\b'): reservedWordStyle,
      RegExp(r'\btrue\b'): reservedWordStyle,
      RegExp(r'\bnull\b'): reservedWordStyle,
      RegExp(r'\bbreak\b'): reservedWordStyle,
      RegExp(r'\bcontinue\b'): reservedWordStyle,
      RegExp(r'\bconst\b'): reservedWordStyle,
      RegExp(r'\btry\b'): reservedWordStyle,
      RegExp(r'\bcatch\b'): reservedWordStyle,
      RegExp(r'\bfinal\b'): reservedWordStyle,
      RegExp(r'\bvar\b'): reservedWordStyle,
      RegExp(r'\bsuper\b'): reservedWordStyle,
      RegExp(r'\bawait\b'): reservedWordStyle,
      RegExp(r'\basync\b'): reservedWordStyle,
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
              onPressed: () async {
                await file.writeAsString(controller.text);
                Fluttertoast.showToast(
                  msg: "File Saved",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                );
              },
              icon: const Icon(Icons.save),
            ),
            IconButton(
              onPressed: () async {
                final navigator = Navigator.of(context);
                await file.writeAsString(controller.text);
                navigator.push(MaterialPageRoute(
                  builder: ((context) => FlutterEvalPage(controller.text)),
                ));
              },
              icon: const Icon(Icons.golf_course),
            ),
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
