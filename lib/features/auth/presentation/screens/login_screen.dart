import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_controller.dart';
import '../widgets/social_auth_button.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider).isLoading;
    final isGoogleLoading = ref
        .watch(authControllerProvider.notifier)
        .isGoogleLoading;
    final isAppleLoading = ref
        .watch(authControllerProvider.notifier)
        .isAppleLoading;

    // Surface any auth error as a snackbar.
    ref.listen(authControllerProvider, (previous, next) {
      if (next.hasError && !next.isLoading) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(next.error.toString()),
              behavior: SnackBarBehavior.floating,
            ),
          );
      }
    });

    final showApple = kIsWeb ? true : (Platform.isIOS || Platform.isMacOS);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 3),
              // Minimal logo mark.
              Center(
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFF111111),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.bolt_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Text(
                'Welcome',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Sign in to continue',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(flex: 4),

              // Google
              SocialAuthButton(
                label: 'Continue with Google',
                isLoading: isGoogleLoading,
                icon: const _GoogleLogo(),
                onPressed: () => ref
                    .read(authControllerProvider.notifier)
                    .signInWithGoogle(),
              ),
              if (showApple) ...[
                const SizedBox(height: 12),
                SocialAuthButton(
                  label: 'Continue with Apple',
                  isLoading: isAppleLoading,
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  icon: const Icon(Icons.apple, color: Colors.white, size: 22),
                  onPressed: () => ref
                      .read(authControllerProvider.notifier)
                      .signInWithApple(),
                ),
              ],

              const SizedBox(height: 24),
              Text(
                'By continuing you agree to our Terms & Privacy Policy.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: const Color(0xFF999999),
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

/// Simple multi-color G mark — no network asset required.
class _GoogleLogo extends StatelessWidget {
  const _GoogleLogo();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(20, 20), painter: _GoogleLogoPainter());
  }
}

class _GoogleLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Blue arc
    paint.color = const Color(0xFF4285F4);
    canvas.drawCircle(center, radius, paint);

    // White inner to give the "G" feel (approximation — good enough for minimal UI)
    paint.color = Colors.white;
    canvas.drawCircle(center, radius * 0.55, paint);

    // Red bar (top-left hint)
    paint.color = const Color(0xFFEA4335);
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width * 0.5, size.height * 0.25),
      paint,
    );

    // Green bar (bottom-left hint)
    paint.color = const Color(0xFF34A853);
    canvas.drawRect(
      Rect.fromLTWH(
        0,
        size.height * 0.75,
        size.width * 0.5,
        size.height * 0.25,
      ),
      paint,
    );

    // Yellow bar (top-right hint)
    paint.color = const Color(0xFFFBBC05);
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.5, 0, size.width * 0.5, size.height * 0.25),
      paint,
    );

    // Re-draw white center so the inner circle stays clean
    paint.color = Colors.white;
    canvas.drawCircle(center, radius * 0.5, paint);

    // Small notch to hint at the "G"
    paint.color = const Color(0xFF4285F4);
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.5,
        size.height * 0.45,
        size.width * 0.5,
        size.height * 0.15,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
