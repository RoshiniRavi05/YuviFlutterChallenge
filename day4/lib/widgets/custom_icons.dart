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
    final arm = size.width * 0.36;

    final path = Path()
      ..moveTo(center.dx, center.dy - arm)
      ..lineTo(center.dx, center.dy)
      ..lineTo(center.dx + arm * 0.65, center.dy + arm * 0.65);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _ClockPainter oldDelegate) => false;
}

/// Pixel-perfect filled eye icon badge matching reference image — filled almond eye body + light center pupil ring.
class EyeIcon extends StatelessWidget {
  final double size;
  final Color eyeColor;
  final Color pupilColor;
  final double strokeWidth;

  const EyeIcon({
    super.key,
    this.size = AppSpacing.cardIconCircleSize,
    this.eyeColor = const Color(0xFF8EB74A),
    this.pupilColor = const Color(0xFFE8F5D0),
    this.strokeWidth = 1.6,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size * 0.70),
      painter: _EyePainter(
        eyeColor: eyeColor,
        pupilColor: pupilColor,
        strokeWidth: strokeWidth,
      ),
    );
  }
}

class _EyePainter extends CustomPainter {
  final Color eyeColor;
  final Color pupilColor;
  final double strokeWidth;

  _EyePainter({
    required this.eyeColor,
    required this.pupilColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final center = Offset(w / 2, h / 2);

    // 1. Solid filled eye almond contour — full wide curves
    final eyePaint = Paint()
      ..color = eyeColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final eyePath = Path()
      ..moveTo(0, center.dy)
      ..cubicTo(w * 0.22, 0, w * 0.78, 0, w, center.dy)
      ..cubicTo(w * 0.78, h, w * 0.22, h, 0, center.dy)
      ..close();

    canvas.drawPath(eyePath, eyePaint);

    // 2. Hollow center pupil ring
    final pupilPaint = Paint()
      ..color = pupilColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    canvas.drawCircle(center, w * 0.18, pupilPaint);
  }

  @override
  bool shouldRepaint(covariant _EyePainter oldDelegate) =>
      oldDelegate.eyeColor != eyeColor ||
      oldDelegate.pupilColor != pupilColor ||
      oldDelegate.strokeWidth != strokeWidth;
}
