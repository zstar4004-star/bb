// FILE: lib/ui/toolbar.dart

import 'package:flutter/material.dart';

class Toolbar extends StatelessWidget {
  final Function(String) onToolChanged;

  const Toolbar({super.key, required this.onToolChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: const Color(0xff1e1e1e),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          tool(Icons.pan_tool, "select"),
          tool(Icons.edit, "pen"),
          tool(Icons.text_fields, "text"),
          tool(Icons.crop_square, "shape"),
        ],
      ),
    );
  }

  Widget tool(IconData icon, String id) {
    return IconButton(
      icon: Icon(icon, color: Colors.white),
      onPressed: () => onToolChanged(id),
    );
  }
}
