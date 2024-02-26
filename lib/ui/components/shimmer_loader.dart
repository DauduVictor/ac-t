import 'package:acm_test/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class AllProductsShimmerList extends StatelessWidget {
  const AllProductsShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.greyColor.withOpacity(0.6),
      highlightColor: Colors.white.withOpacity(0.5),
      period: const Duration(milliseconds: 1500),
      enabled: true,
      child: GridView.builder(
        padding: const EdgeInsets.fromLTRB(24, 20, 20, 40),
        itemCount: 4,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 0,
        ),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 150.h,
                width: 150.h,
                color: AppColors.greyColor.withOpacity(0.2),
              ),
              Container(
                height: 16.h,
                width: 80.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppColors.greyColor.withOpacity(0.2),
                ),
              ),
              const SizedBox(height: 6),
              Container(
                height: 11.h,
                width: 30.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppColors.greyColor.withOpacity(0.2),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
