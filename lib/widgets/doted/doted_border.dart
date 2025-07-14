import 'package:flutter_application_1/core/common.dart';

enum DottedLineDirection { horizontal, vertical }

class DottedLine extends StatelessWidget {
  final double length;
  final double dotThickness; // height (horizontal) ya width (vertical)
  final double dashLength;
  final double dashSpace;
  final Color color;
  final DottedLineDirection direction;

  const DottedLine({
    super.key,
    this.length = 100,
    this.dotThickness = 1,
    this.dashLength = 5,
    this.dashSpace = 3,
    this.color = Colors.black,
    this.direction = DottedLineDirection.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: direction == DottedLineDirection.horizontal
          ? Size(length, dotThickness)
          : Size(dotThickness, length),
      painter: _DottedLinePainter(
        color: color,
        direction: direction,
        dotThickness: dotThickness,
        dashLength: dashLength,
        dashSpace: dashSpace,
      ),
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  final Color color;
  final DottedLineDirection direction;
  final double dotThickness;
  final double dashLength;
  final double dashSpace;

  _DottedLinePainter({
    required this.color,
    required this.direction,
    required this.dotThickness,
    required this.dashLength,
    required this.dashSpace,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = dotThickness;

    double start = 0;

    if (direction == DottedLineDirection.horizontal) {
      final y = size.height / 2;
      while (start < size.width) {
        canvas.drawLine(
          Offset(start, y),
          Offset(start + dashLength, y),
          paint,
        );
        start += dashLength + dashSpace;
      }
    } else {
      final x = size.width / 2;
      while (start < size.height) {
        canvas.drawLine(
          Offset(x, start),
          Offset(x, start + dashLength),
          paint,
        );
        start += dashLength + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


// DottedLine(
//       length: 200,
//       dotThickness: 4, // height of horizontal line
//       dashLength: 6,
//       dashSpace: 4,
//       color: Colors.red,
//     ),