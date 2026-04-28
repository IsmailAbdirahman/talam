import 'package:flutter/material.dart';

/// A minimal, outlined button used for Google / Apple sign-in.
class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.icon,
    this.isLoading = false,
    this.backgroundColor,
    this.foregroundColor,
  });

  final String label;
  final VoidCallback? onPressed;
  final Widget icon;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Colors.white,
        foregroundColor: foregroundColor ?? const Color(0xFF111111),
        disabledBackgroundColor: (backgroundColor ?? Colors.white).withValues(
          alpha: 0.7,
        ),
      ),
      child: isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: foregroundColor ?? const Color(0xFF111111),
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 20, height: 20, child: icon),
                const SizedBox(width: 12),
                Text(label),
              ],
            ),
    );
  }
}
