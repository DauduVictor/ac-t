import 'package:acm_test/gen/assets.gen.dart';
import 'package:acm_test/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatelessWidget {
  static const String id = 'splashScreen';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppAssets.images.xImg
                .image(
                  fit: BoxFit.contain,
                  scale: 3,
                )
                .animate(
                  onComplete: (controller) =>
                      Navigator.pushNamed(context, OnboardingScreen.id),
                )
                .shake(duration: 2.seconds, hz: 3)
                .callback(callback: (_) {}),
            AppAssets.images.issorsImg.image(
              fit: BoxFit.contain,
              scale: 3,
            ),
          ],
        ),
      ),
    );
  }
}
