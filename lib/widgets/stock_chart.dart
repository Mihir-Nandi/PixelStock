import 'package:flutter/material.dart';

class StockChart extends StatelessWidget {
  final List<double> data;
  final Color color;

  const StockChart({
    super.key,
    required this.data,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ChartPainter(data: data, color: color),
      size: const Size(double.infinity, double.infinity),
    );
  }
}

class ChartPainter extends CustomPainter {
  final List<double> data;
  final Color color;

  ChartPainter({required this.data, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    // Calculate scaling
    final double max = data.reduce((curr, next) => curr > next ? curr : next);
    final double min = data.reduce((curr, next) => curr < next ? curr : next);
    final double range = max - min;
    final double xStep = width / (data.length - 1);

    // Create path for the line
    final Path path = Path();
    for (int i = 0; i < data.length; i++) {
      final double x = i * xStep;
      final double y = height - ((data[i] - min) / range) * height;

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    // Create path for the area under the line
    final Path areaPath = Path.from(path);
    areaPath.lineTo(width, height);
    areaPath.lineTo(0, height);
    areaPath.close();

    // Draw area with gradient
    final Paint areaPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          color.withOpacity(0.2),
          color.withOpacity(0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, width, height));

    canvas.drawPath(areaPath, areaPaint);

    // Draw line
    final Paint linePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

