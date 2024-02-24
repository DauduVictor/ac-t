import 'package:acm_test/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Indicator extends StatelessWidget {
  const Indicator({super.key, this.currentPage = false});

  final bool? currentPage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: 1.seconds,
        height: 4.w,
        margin: const EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          color: currentPage == true
              ? AppColors.whiteColor
              : AppColors.whiteColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(1),
        ),
      ),
    );
  }
}
