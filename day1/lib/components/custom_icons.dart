import 'package:flutter/material.dart';

import '../constants/app_spacing.dart';
import '../theme/app_colors.dart';

/// Hairline editorial navigation arrow — short shaft, crisp 45° arrowhead.
class ThinArrowIcon extends StatelessWidget {
  final bool pointingRight;
  final Color color;

  const ThinArrowIcon({
    super.key,
    this.pointingRight = false,
    this.color = AppColors.text,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(
        AppSpacing.monthArrowWidth,
        AppSpacing.monthArrowHeight,
      ),
      painter: _ThinArrowPainter(
        pointingRight: pointingRight,
        color: color,
      ),
    );
  }
}

class _ThinArrowPainter extends CustomPainter {
  final bool pointingRight;
  final Color color;

  _ThinArrowPainter({
    required this.pointingRight,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final w = size.width;
    final h = size.height;
    final cy = h / 2;
    final wing = h * 0.42;

    final path = Path();

    if (pointingRight) {
      path.moveTo(0, cy);
      path.lineTo(w, cy);
      path.moveTo(w - wing, cy - wing);
      path.lineTo(w, cy);
      path.lineTo(w - wing, cy + wing);
    } else {
      path.moveTo(w, cy);
      path.lineTo(0, cy);
      path.moveTo(wing, cy - wing);
      path.lineTo(0, cy);
      path.lineTo(wing, cy + wing);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _ThinArrowPainter oldDelegate) =>
      oldDelegate.pointingRight != pointingRight || oldDelegate.color != color;
}

/// Outlined bell icon for notification button.
class BellIcon extends StatelessWidget {
  final double size;
  final Color color;
  final double strokeWidth;

  const BellIcon({
    super.key,
    this.size = AppSpacing.notificationBellSize,
    this.color = AppColors.text,
    this.strokeWidth = 1.3,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _BellPainter(color: color, strokeWidth: strokeWidth),
    );
  }
}

class _BellPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  _BellPainter({required this.color, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final scale = size.width / 24.0;
    canvas.save();
    canvas.scale(scale, scale);

    final bell = Path()
      ..moveTo(10.2, 4.6)
      ..cubicTo(10.2, 2.5, 13.8, 2.5, 13.8, 4.6)
      ..cubicTo(15.2, 4.8, 16.5, 7.5, 16.5, 10.8)
      ..cubicTo(16.5, 13.5, 17.8, 15.2, 19.3, 16.2)
      ..cubicTo(20.2, 16.8, 19.8, 17.6, 18.5, 17.6)
      ..lineTo(5.5, 17.6)
      ..cubicTo(4.2, 17.6, 3.8, 16.8, 4.7, 16.2)
      ..cubicTo(6.2, 15.2, 7.5, 13.5, 7.5, 10.8)
      ..cubicTo(7.5, 7.5, 8.8, 4.8, 10.2, 4.6);

    final clapper = Path()
      ..moveTo(9.5, 17.6)
      ..arcToPoint(
        const Offset(14.5, 17.6),
        radius: const Radius.circular(2.6),
        clockwise: false,
      );

    canvas.drawPath(bell, paint);
    canvas.drawPath(clapper, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _BellPainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.strokeWidth != strokeWidth;
}

/// Minimal clock hands matching reference image — white angled L-hands.
class ClockIcon extends StatelessWidget {
  final double size;
  final Color color;
  final double strokeWidth;

  const ClockIcon({
    super.key,
    this.size = AppSpacing.cardClockIconSize,
    this.color = AppColors.white,
    this.strokeWidth = 1.6,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _ClockPainter(color: color, strokeWidth: strokeWidth),
    );
  }
}

class _ClockPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  _ClockPainter({required this.color, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final center = Offset(size.width / 2, size.height / 2);
    final arm = size.width * 0.38;

    final path = Path()
      ..moveTo(center.dx, center.dy - arm)
      ..lineTo(center.dx, center.dy)
      ..lineTo(center.dx + arm * 0.65, center.dy + arm * 0.65);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _ClockPainter oldDelegate) => false;
}

/// Outlined eye icon matching reference image — white almond eye outer contour + center pupil ring.
class EyeIcon extends StatelessWidget {
  final double size;
  final Color color;
  final double strokeWidth;

  const EyeIcon({
    super.key,
    this.size = AppSpacing.cardEyeIconSize,
    this.color = AppColors.white,
    this.strokeWidth = 1.2,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size * 0.62),
      painter: _EyePainter(color: color, strokeWidth: strokeWidth),
    );
  }
}

class _EyePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  _EyePainter({required this.color, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final w = size.width;
    final h = size.height;
    final center = Offset(w / 2, h / 2);

    // Almond outer eye contour
    final eye = Path()
      ..moveTo(0, center.dy)
      ..quadraticBezierTo(w / 2, -1.0, w, center.dy)
      ..quadraticBezierTo(w / 2, h + 1.0, 0, center.dy);
    canvas.drawPath(eye, paint);

    // Center pupil circle ring
    canvas.drawCircle(center, w * 0.18, paint);
  }

  @override
  bool shouldRepaint(covariant _EyePainter oldDelegate) => false;
}
