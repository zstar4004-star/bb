import 'package:flutter/material.dart';
import 'canvas/editor_canvas.dart';
import 'ui/toolbar.dart';

void main() {
  runApp(const FigmaCloneApp());
}

class FigmaCloneApp extends StatelessWidget {
  const FigmaCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const EditorShell(),
    );
  }
}

class EditorShell extends StatefulWidget {
  const EditorShell({super.key});

  @override
  State<EditorShell> createState() => _EditorShellState();
}

class _EditorShellState extends State<EditorShell> {
  String tool = "select";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),

      body: Stack(
        children: [
          EditorCanvas(activeTool: tool),

          Align(
            alignment: Alignment.topCenter,
            child: Toolbar(
              onToolChanged: (t) {
                setState(() => tool = t);
              },
            ),
          ),
        ],
      ),
    );
  }
}
