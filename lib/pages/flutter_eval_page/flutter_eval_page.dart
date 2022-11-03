import 'package:flutter/material.dart';
import 'package:flutter_eval/flutter_eval.dart';

class FlutterEvalPage extends StatelessWidget {
  FlutterEvalPage(this.code, {super.key});

  String code;

  @override
  Widget build(BuildContext context) {
    return EvalWidget(
      assetPath: 'assets/program.evc',
      library: 'package:example/main.dart',
      function: 'TWidget.',
      packages: {
        'example': {'main.dart': code}
      },
    );
  }
}
