import 'package:acm_test/ui/ui.dart';
import 'package:acm_test/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  static const String id = 'onboardingScreen';
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  /// Declaring the animation controller for the animation
  late AnimationController _animationController;
  int currentPage = 0;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: 10.seconds,
      vsync: this,
    );
    super.initState();

    _animationController.addListener(() {
      setState(() {
        if (_animationController.value < 0.3) {
          currentPage = 0;
        } else if (_animationController.value > 0.3 &&
            _animationController.value < 0.6) {
          currentPage = 1;
        } else {
          currentPage = 2;
        }
      });
    });

    /// animation to repeat and reverse set to true
    _animationController.repeat(reverse: false);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    List<Widget> buildPageIndicator() {
      List<Widget> list = [];
      for (int i = 0; i < 3; i++) {
        list.add(i == currentPage
            ? const Indicator(currentPage: true)
            : const Indicator(currentPage: false));
      }
      return list;
    }

    Map<int, String> headerText = {
      0: 'Save money & get up to 40% commission on selling products',
      1: 'Make more money  by growing your business',
      2: 'Send commisions & tips directly to your bank account',
    };

    Map<int, String> image = {
      0: AssetsPath.onboardingImageOne,
      1: AssetsPath.onboardingImageTwo,
      2: AssetsPath.onboardingImageThree,
    };

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            image[currentPage] ?? AssetsPath.onboardingImageOne,
            fit: BoxFit.cover,
          ).animate().fadeIn(),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.blackColor.withOpacity(0.1),
                  AppColors.blackColor.withOpacity(0.5),
                  AppColors.blackColor.withOpacity(0.6),
                  AppColors.blackColor.withOpacity(0.95),
                  AppColors.blackColor,
                ],
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              Row(children: buildPageIndicator()),
              SizedBox(height: 35.h),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AssetsPath.xImage,
                    fit: BoxFit.contain,
                    scale: 3.5,
                  ),
                  Image.asset(
                    AssetsPath.issorsImage,
                    fit: BoxFit.contain,
                    scale: 3.5,
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  headerText[currentPage] ?? '',
                  textAlign: TextAlign.center,
                  style: textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ).animate().fadeIn(),
              ),
              SizedBox(height: 28.h),
              Button(
                label: 'Log in',
                width: mqr.width * 0.9,
                onPressed: () => Navigator.pushNamed(context, LoginScreen.id),
              ),
              const SizedBox(height: 16),
              Button(
                label: 'Get Started',
                width: mqr.width * 0.9,
                color: AppColors.lightBlueColor,
                labelColor: AppColors.primaryColor,
                onPressed: () {},
              ),
              SizedBox(height: MediaQuery.of(context).padding.top),
            ].animate().fadeIn(),
          ),
        ],
      ),
    );
  }
}
