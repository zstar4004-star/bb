// FILE: lib/core/system/file_io.dart

import '../model/node.dart';

class FileIO {
  static Map<String, dynamic> export(List<Node> nodes) {
    return {
      "nodes": nodes.map((n) => {
        "id": n.id,
        "x": n.position.dx,
        "y": n.position.dy,
        "w": n.width,
        "h": n.height,
      }).toList()
    };
  }
}
