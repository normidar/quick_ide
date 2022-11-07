import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quick_ide/pages/input_page/input_page.dart';

class FileChooser extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choose your file')),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () async {
                String enterText = controller.text;
                if (enterText != '') {
                  const filePath = '/storage/emulated/0/Documents';
                  // final filePath = (await getApplicationSupportDirectory()).path;
                  print(await getExternalStorageDirectory());
                  print(await getApplicationDocumentsDirectory());
                  print(await getApplicationSupportDirectory());
                  print(filePath);
                  final file = File('$filePath/$enterText' '.dart');
                  if (!await file.exists()) {
                    file.create();
                    await file.writeAsString("""
import 'package:flutter/material.dart';


class TWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ;
  }
}
""");
                    Fluttertoast.showToast(
                        msg: "This is Center Short Toast",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                }
              },
              child: const Text('Choose dir and create file'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.open_in_browser),
        onPressed: () async {
          final navigator = Navigator.of(context);
          FilePickerResult? result = await FilePicker.platform.pickFiles();

          if (result != null) {
            File file = File(result.files.single.path!);
            String fileContext = await file.readAsString();
            navigator.push(MaterialPageRoute(builder: ((context) {
              return InputPage(
                file: file,
                text: fileContext,
              );
            })));
          } else {
            // User canceled the picker
          }
        },
      ),
    );
  }
}
