import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ui/ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Unfocus(
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Acumen Test',
            initialRoute: SplashScreen.id,
            theme: AppTheme.themeData,
            routes: {
              SplashScreen.id: (context) => const SplashScreen(),
              OnboardingScreen.id: (context) => const OnboardingScreen(),
              LoginScreen.id: (context) => const LoginScreen(),
              AllProducts.id: (context) => const AllProducts(),
              SummaryScreen.id: (context) => const SummaryScreen(),
            },
          );
        },
      ),
    );
  }
}
