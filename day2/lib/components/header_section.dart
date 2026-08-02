import 'package:flutter/material.dart';

import '../constants/app_spacing.dart';
import '../theme/text_styles.dart';
import 'avatar_widget.dart';
import 'notification_button.dart';

/// Header row: avatar, greeting, and notification button on shared baseline.
class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const AvatarWidget(),
        const SizedBox(width: AppSpacing.avatarToGreeting),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'Hello, ', style: AppTextStyles.greetingBold),
                TextSpan(text: 'Sophia', style: AppTextStyles.greetingRegular),
              ],
            ),
          ),
        ),
        const NotificationButton(),
      ],
    );
  }
}
