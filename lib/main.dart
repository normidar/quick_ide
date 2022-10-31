import 'package:flutter/material.dart';
import 'package:quick_ide/pages/keyboard/keyboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Scrollbar(
              controller: scrollController,
              thumbVisibility: true,
              child: TextField(
                controller: controller,
                scrollController: scrollController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                style: const TextStyle(fontSize: 24),
                autofocus: true,
                minLines: 2,
                maxLines: null,
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
