// FILE: lib/main.dart

import 'package:flutter/material.dart';
import 'canvas/editor_canvas.dart';
import 'ui/toolbar.dart';

void main() {
  runApp(const FigmaApp());
}

class FigmaApp extends StatelessWidget {
  const FigmaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EditorShell(),
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
