import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/colors.dart';

/// 1. Star Icon: Outline star loaded from SVG asset.
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
    return SvgPicture.asset(
      'assets/images/star.svg',
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}

/// 2. Edit / Pencil Icon: Outline pencil loaded from SVG asset.
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
    return SvgPicture.asset(
      'assets/images/pencil.svg',
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
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
    return Icon(
      Icons.more_horiz,
      color: color,
      size: size,
    );
  }
}
