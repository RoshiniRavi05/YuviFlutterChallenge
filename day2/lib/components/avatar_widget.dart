import 'package:flutter/material.dart';

import '../constants/app_spacing.dart';

/// Circular profile avatar for the header.
class AvatarWidget extends StatelessWidget {
  const AvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        'assets/images/avatar.png',
        width: AppSpacing.avatarSize,
        height: AppSpacing.avatarSize,
        fit: BoxFit.cover,
      ),
    );
  }
}
