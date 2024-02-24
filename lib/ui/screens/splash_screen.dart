import 'package:acm_test/ui/ui.dart';
import 'package:acm_test/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatelessWidget {
  static const String id = 'splashScreen';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Function to navigate to the next screen after the splash screen is completed
    void navigate() {
      Navigator.pushNamed(context, OnboardingScreen.id);
    }

    return Scaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AssetsPath.xImage,
              fit: BoxFit.contain,
              scale: 3,
            )
                .animate(
                  onComplete: (controller) => navigate(),
                )
                .shake(duration: 2.seconds, hz: 3)
                .callback(callback: (_) {}),
            Image.asset(
              AssetsPath.issorsImage,
              fit: BoxFit.contain,
              scale: 3,
            ),
          ],
        ),
      ),
    );
  }
}
