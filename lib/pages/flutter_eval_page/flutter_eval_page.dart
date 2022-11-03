import 'package:flutter/material.dart';

class FlutterEvalPage extends StatelessWidget {
  FlutterEvalPage(this.code);

  String code;

  @override
  Widget build(BuildContext context) {
    return EvalWidget(packages: {
      'example': {
        'main.dart': '''
    import 'package:flutter/material.dart';
    
    class MyWidget extends StatelessWidget {
      MyWidget(this.name);
      final String name;

      @override
      Widget build(BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(children: [
              Container(
                color: Colors.red,
                child: Text('The name is ' + name)
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          )
        );
      }
    }''',
        assetPath: 'assets/program.evc',
        library: 'package:example/main.dart',
        function: 'MyWidget.',
        args: [$String('Example name')]
      }
    });
  }
}
