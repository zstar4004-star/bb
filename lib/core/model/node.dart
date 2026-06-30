// FILE: lib/core/model/node.dart

import 'dart:ui';

enum NodeType { shape, text, path, component }

class Node {
  String id;
  NodeType type;

  Offset position;
  double size;

  String? text;
  Path? path;

  Color fill;

  bool selected;

  Node({
    required this.id,
    required this.type,
    required this.position,
    this.size = 120,
    this.text,
    this.path,
    this.fill = const Color(0xff8d6e63),
    this.selected = false,
  });
}
