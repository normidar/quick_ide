import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quick_ide/pages/keyboard/keyboard.dart';
import 'package:quick_ide/pages/keyboard/rich_text_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    return Scaffold(
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
    );
  }
}
