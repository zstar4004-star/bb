// FILE: lib/canvas/editor_canvas.dart

import 'package:flutter/material.dart';
import '../core/model/node.dart';
import '../core/engine/editor_controller.dart';

class EditorCanvas extends StatefulWidget {
  final String activeTool;

  const EditorCanvas({super.key, required this.activeTool});

  @override
  State<EditorCanvas> createState() => _EditorCanvasState();
}

class _EditorCanvasState extends State<EditorCanvas> {
  final controller = EditorController();

  Offset offset = Offset.zero;
  double zoom = 1;

  @override
  void initState() {
    super.initState();

    controller.add(
      Node(
        id: "root",
        type: NodeType.shape,
        position: const Offset(300, 300),
      ),
    );
  }

  Node? hitTest(Offset p) {
    for (final n in controller.nodes.reversed) {
      final r = Rect.fromCenter(
        center: n.position,
        width: n.width,
        height: n.height,
      );

      if (r.contains(p)) return n;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (d) {
        controller.select(hitTest(d.localPosition));
        setState(() {});
      },

      onPanUpdate: (d) {
        if (controller.selected != null) {
          controller.move(controller.selected!, d.delta / zoom);
        } else {
          setState(() => offset += d.delta);
        }
      },

      child: Transform.translate(
        offset: offset,
        child: Transform.scale(
          scale: zoom,
          child: CustomPaint(
            size: Size.infinite,
            painter: EditorPainter(controller.nodes),
          ),
        ),
      ),
    );
  }
}

class EditorPainter extends CustomPainter {
  final List<Node> nodes;

  EditorPainter(this.nodes);

  @override
  void paint(Canvas canvas, Size size) {
    for (final n in nodes) {
      final paint = Paint()
        ..color = n.fill
        ..style = PaintingStyle.fill;

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: n.position,
            width: n.width,
            height: n.height,
          ),
          const Radius.circular(12),
        ),
        paint,
      );

      if (n.selected) {
        final border = Paint()
          ..color = Colors.blue
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2;

        canvas.drawRect(
          Rect.fromCenter(
            center: n.position,
            width: n.width + 10,
            height: n.height + 10,
          ),
          border,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
