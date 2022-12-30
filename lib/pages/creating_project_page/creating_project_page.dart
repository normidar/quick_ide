import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quick_ide/pages/input_page/example_input_page.dart';

class CreatingProjectPage extends StatefulWidget {
  const CreatingProjectPage({super.key});

  @override
  State<CreatingProjectPage> createState() => _CreatingProjectPageState();
}

class _CreatingProjectPageState extends State<CreatingProjectPage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: ((_) => ExampleInputPage())));
    });
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LoadingAnimationWidget.threeArchedCircle(
            color: Colors.black,
            size: 50,
          ),
          const SizedBox(height: 30),
          const Text('loading...'),
        ],
      )),
    );
  }
}
