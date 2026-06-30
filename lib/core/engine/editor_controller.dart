// FILE: lib/core/engine/editor_controller.dart

import '../model/node.dart';
import 'dart:ui';

class EditorController {
  List<Node> nodes = [];
  Node? selected;

  void add(Node node) {
    nodes.add(node);
  }

  void select(Node? node) {
    for (final n in nodes) {
      n.selected = false;
    }

    selected = node;
    if (node != null) node.selected = true;
  }

  void move(Node node, Offset delta) {
    node.position += delta;
  }

  void delete(Node node) {
    nodes.remove(node);
  }
}
