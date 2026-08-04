import 'package:flutter/material.dart';
import '../constants/colors.dart';

/// 1. Star Icon: Smooth rounded 5-point outline star matching reference.
class RoundedStarIcon extends StatelessWidget {
  final double size;
  final Color color;

  const RoundedStarIcon({
    super.key,
    this.size = 18.0,
    this.color = AppColors.textDark,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _StarSvgPainter(color: color),
      ),
    );
  }
}

class _StarSvgPainter extends CustomPainter {
  final Color color;

  const _StarSvgPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final double s = size.width / 24.0;

    final Path path = Path();
    path.moveTo(12 * s, 2.5 * s);
    path.cubicTo(12.4 * s, 2.5 * s, 12.8 * s, 2.7 * s, 13.1 * s, 3.2 * s);
    path.lineTo(15.4 * s, 7.4 * s);
    path.cubicTo(15.6 * s, 7.8 * s, 16.0 * s, 8.1 * s, 16.5 * s, 8.2 * s);
    path.lineTo(21.2 * s, 8.8 * s);
    path.cubicTo(22.1 * s, 8.9 * s, 22.5 * s, 10.0 * s, 21.8 * s, 10.6 * s);
    path.lineTo(18.3 * s, 13.9 * s);
    path.cubicTo(17.9 * s, 14.3 * s, 17.8 * s, 14.8 * s, 17.9 * s, 15.3 * s);
    path.lineTo(18.8 * s, 20.0 * s);
    path.cubicTo(19.0 * s, 20.9 * s, 18.0 * s, 21.6 * s, 17.2 * s, 21.1 * s);
    path.lineTo(13.0 * s, 18.9 * s);
    path.cubicTo(12.5 * s, 18.6 * s, 11.9 * s, 18.6 * s, 11.5 * s, 18.9 * s);
    path.lineTo(7.3 * s, 21.1 * s);
    path.cubicTo(6.5 * s, 21.6 * s, 5.5 * s, 20.9 * s, 5.7 * s, 20.0 * s);
    path.lineTo(6.6 * s, 15.3 * s);
    path.cubicTo(6.7 * s, 14.8 * s, 6.5 * s, 14.3 * s, 6.1 * s, 13.9 * s);
    path.lineTo(2.6 * s, 10.6 * s);
    path.cubicTo(2.0 * s, 10.0 * s, 2.3 * s, 8.9 * s, 3.2 * s, 8.8 * s);
    path.lineTo(7.9 * s, 8.2 * s);
    path.cubicTo(8.4 * s, 8.1 * s, 8.8 * s, 7.8 * s, 9.0 * s, 7.4 * s);
    path.lineTo(11.3 * s, 3.2 * s);
    path.cubicTo(11.6 * s, 2.7 * s, 12.0 * s, 2.5 * s, 12 * s, 2.5 * s);
    path.close();

    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.09
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _StarSvgPainter oldDelegate) =>
      oldDelegate.color != color;
}

/// 2. Edit / Pencil Icon: Outline tilted pencil pointing down-left with eraser line and underline.
class EditPencilIcon extends StatelessWidget {
  final double size;
  final Color color;

  const EditPencilIcon({
    super.key,
    this.size = 18.0,
    this.color = AppColors.textDark,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _EditPencilSvgPainter(color: color),
      ),
    );
  }
}

class _EditPencilSvgPainter extends CustomPainter {
  final Color color;

  const _EditPencilSvgPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.09
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final double s = size.width / 24.0;

    // 1. Pencil outline path
    final Path pencilPath = Path();
    pencilPath.moveTo(15.5 * s, 3.5 * s);
    pencilPath.cubicTo(16.8 * s, 2.2 * s, 18.9 * s, 2.2 * s, 20.2 * s, 3.5 * s);
    pencilPath.cubicTo(21.5 * s, 4.8 * s, 21.5 * s, 6.9 * s, 20.2 * s, 8.2 * s);
    pencilPath.lineTo(9.5 * s, 18.9 * s);
    pencilPath.lineTo(5.0 * s, 18.9 * s);
    pencilPath.lineTo(5.0 * s, 14.4 * s);
    pencilPath.lineTo(15.5 * s, 3.5 * s);
    pencilPath.close();

    canvas.drawPath(pencilPath, paint);

    // 2. Eraser cap divider line near top
    canvas.drawLine(
      Offset(13.5 * s, 5.5 * s),
      Offset(18.5 * s, 10.5 * s),
      paint,
    );

    // 3. Horizontal Underline stroke below pencil
    canvas.drawLine(
      Offset(3.0 * s, 22.0 * s),
      Offset(21.0 * s, 22.0 * s),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _EditPencilSvgPainter oldDelegate) =>
      oldDelegate.color != color;
}

/// Three horizontal circular dots icon matching reference screenshot.
class MoreDotsIcon extends StatelessWidget {
  final double size;
  final Color color;

  const MoreDotsIcon({
    super.key,
    this.size = 18.0,
    this.color = AppColors.textDark,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _MoreDotsPainter(color: color),
      ),
    );
  }
}

class _MoreDotsPainter extends CustomPainter {
  final Color color;

  const _MoreDotsPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final double cy = size.height * 0.52;
    const double radius = 1.4;
    final double spacing = size.width * 0.26;
    final double startX = size.width * 0.24;

    for (int i = 0; i < 3; i++) {
      canvas.drawCircle(Offset(startX + (i * spacing), cy), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _MoreDotsPainter oldDelegate) =>
      oldDelegate.color != color;
}
