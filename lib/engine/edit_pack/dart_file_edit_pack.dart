import 'package:quick_ide/engine/edit_pack/edit_pack.dart';

class DartFileEditPack extends EditPack {
  DartFileEditPack({required this.projectPath, this.includeFileType = const ['dart']});
  final String projectPath;
  final List<String> includeFileType;
}
