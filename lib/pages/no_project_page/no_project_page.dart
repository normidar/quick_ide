import 'package:flutter/material.dart';
import 'package:quick_ide/pages/choose_fod_page/choose_fod_page.dart';

class NoProjectPage extends StatefulWidget {
  const NoProjectPage({super.key});

  @override
  State<NoProjectPage> createState() => _NoProjectPageState();
}

class _NoProjectPageState extends State<NoProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const Flexible(child: FractionallySizedBox(heightFactor: 0.4)),
              ElevatedButton(
                onPressed: (() {
                  Navigator.push(
                      context, MaterialPageRoute(builder: ((context) => const ChooseFodPage())));
                }),
                child: const Text('プロジェクト作成'),
              ),
              const Flexible(child: FractionallySizedBox(heightFactor: 0.4)),
              ElevatedButton(
                onPressed: (() {}),
                child: const Text('Githubからインポート'),
              ),
              const Flexible(child: FractionallySizedBox(heightFactor: 0.4)),
              ElevatedButton(
                onPressed: (() {}),
                child: const Text('ローカルからインポート'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
