import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quick_ide/pages/input_page/file_chooser.dart';
import 'package:quick_ide/pages/no_project_page/no_project_page.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const NoProjectPage(),
    );
  }
}
