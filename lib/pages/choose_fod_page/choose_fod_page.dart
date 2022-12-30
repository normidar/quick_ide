import 'package:flutter/material.dart';
import 'package:quick_ide/pages/creating_project_page/creating_project_page.dart';

class ChooseFodPage extends StatefulWidget {
  const ChooseFodPage({super.key});

  @override
  State<ChooseFodPage> createState() => _ChooseFodPageState();
}

class _ChooseFodPageState extends State<ChooseFodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: ((_) => const CreatingProjectPage())));
                  },
                  child: const Text('Flutterプロジェクト'),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Dartプロジェクト'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
