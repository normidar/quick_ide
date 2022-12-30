import 'package:flutter/widgets.dart';

/// a custom controller based on [TextEditingController] used to activly style input text based on regex patterns and word matching
/// with some custom features.
/// {@tool snippet}
///
/// ```dart
/// class _ExampleState extends State<Example> {
///
///   late RichTextController _controller;
///
/// _controller = RichTextController(
///       deleteOnBack: true,
///       patternMatchMap: {
///         //Returns every Hashtag with red color
///         RegExp(r"\B#[a-zA-Z0-9]+\b"):
///             const TextStyle(color: Colors.red, fontSize: 22.0),
///         //Returns every Mention with blue color and bold style.
///         RegExp(r"\B@[a-zA-Z0-9]+\b"): const TextStyle(
///           fontWeight: FontWeight.w800,
///           color: Colors.blue,
///         ),
///
///  TextFormField(
///  controller: _controller,
///  ...
/// )
///
/// ```
/// {@end-tool}
class HighLightTextController extends TextEditingController {
  static const reservedWordStyle = TextStyle(color: Color.fromARGB(255, 38, 172, 255));
  final Map<RegExp, TextStyle>? patternMatchMap = {
    RegExp(r"'.*?'"): const TextStyle(color: Color.fromARGB(255, 224, 75, 20)),
    RegExp(r'".*?"'): const TextStyle(color: Color.fromARGB(255, 224, 75, 20)),
    RegExp(r'\bclass\b'): reservedWordStyle,
    RegExp(r'\bwhile\b'): reservedWordStyle,
    RegExp(r'@override\b'): reservedWordStyle,
    RegExp(r'\breturn\b'): reservedWordStyle,
    RegExp(r'\bimport\b'): reservedWordStyle,
    RegExp(r'\bif\b'): reservedWordStyle,
    RegExp(r'\belse\b'): reservedWordStyle,
    RegExp(r'\bfor\b'): reservedWordStyle,
    RegExp(r'\bas\b'): reservedWordStyle,
    RegExp(r'\bfalse\b'): reservedWordStyle,
    RegExp(r'\btrue\b'): reservedWordStyle,
    RegExp(r'\bnull\b'): reservedWordStyle,
    RegExp(r'\bbreak\b'): reservedWordStyle,
    RegExp(r'\bcontinue\b'): reservedWordStyle,
    RegExp(r'\bconst\b'): reservedWordStyle,
    RegExp(r'\btry\b'): reservedWordStyle,
    RegExp(r'\bcatch\b'): reservedWordStyle,
    RegExp(r'\bfinal\b'): reservedWordStyle,
    RegExp(r'\bvar\b'): reservedWordStyle,
    RegExp(r'\bsuper\b'): reservedWordStyle,
    RegExp(r'\bawait\b'): reservedWordStyle,
    RegExp(r'\basync\b'): reservedWordStyle,
  };
  final String Function(List<String> match) onMatch = ((match) {
    return '*';
  });
  final bool? deleteOnBack;
  String _lastValue = "";

  bool isBack(String current, String last) {
    return current.length < last.length;
  }

  HighLightTextController({
    String? text,
    this.deleteOnBack = false,
  }) : super(text: text);

  @override
  TextSpan buildTextSpan({required BuildContext context, TextStyle? style, required bool withComposing}) {
    List<TextSpan> children = [];
    List<String> matches = [];

    // Validating with REGEX
    RegExp? allRegex;
    allRegex =
        patternMatchMap != null ? RegExp(patternMatchMap?.keys.map((e) => e.pattern).join('|') ?? "") : null;

    text.splitMapJoin(
      allRegex!,
      onNonMatch: (String span) {
        children.add(TextSpan(text: span, style: style));
        return span.toString();
      },
      onMatch: (Match m) {
        if (!matches.contains(m[0])) matches.add(m[0]!);
        final RegExp? k = patternMatchMap?.entries.firstWhere((element) {
          return element.key.allMatches(m[0]!).isNotEmpty;
        }).key;
        if (deleteOnBack!) {
          if ((isBack(text, _lastValue) && m.end == selection.baseOffset)) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              children.removeWhere((element) => element.text! == text);
              text = text.replaceRange(m.start, m.end, "");
              selection = selection.copyWith(
                baseOffset: m.end - (m.end - m.start),
                extentOffset: m.end - (m.end - m.start),
              );
            });
          } else {
            children.add(
              TextSpan(
                text: m[0],
                style: patternMatchMap![k],
              ),
            );
          }
        } else {
          children.add(
            TextSpan(
              text: m[0],
              style: patternMatchMap![k],
            ),
          );
        }

        return (onMatch(matches));
      },
    );

    _lastValue = text;
    return TextSpan(style: style, children: children);
  }
}
