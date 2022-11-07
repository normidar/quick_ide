import 'package:flutter/material.dart';
import 'package:flutter_eval/flutter_eval.dart';
import 'package:quick_ide/engine/edit_pack/edit_pack.dart';

class FlutterStringPack extends EditPack {
  FlutterStringPack({required this.code, this.widgetName = 'MyWidget'});
  String code;
  String widgetName;

  Widget getWidget() {
    return EvalWidget(
      assetPath: 'assets/program.evc',
      library: 'package:example/main.dart',
      function: '$widgetName.',
      packages: {
        'example': {'main.dart': code}
      },
    );
  }
}
