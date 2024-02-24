import 'package:acm_test/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummaryScreen extends StatelessWidget {
  static const String id = 'summaryScreen';
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final mqr = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: InkWell(
          splashColor: AppColors.primaryColor.withOpacity(0.2),
          highlightColor: AppColors.primaryColor.withOpacity(0.2),
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.chevron_left,
                ),
                const SizedBox(width: 5),
                Text(
                  'Back',
                  textScaler: const TextScaler.linear(1),
                  style: textTheme.bodySmall!.copyWith(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        title: Text(
          'Sumamry',
          style: textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: RawScrollbar(
        thumbVisibility: true,
        thumbColor: AppColors.primaryColor.withOpacity(0.4),
        radius: const Radius.circular(5.0),
        thickness: 2,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                color: AppColors.lightBgColor,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 11,
                        horizontal: 16,
                      ),
                      color: AppColors.lightGreyColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'VIEW BREAKDOWN',
                            textScaler: const TextScaler.linear(1),
                            style: textTheme.bodyMedium!.copyWith(
                              color: AppColors.whiteColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const CircleAvatar(
                              radius: 12,
                              backgroundColor: AppColors.blackColor3,
                              child: Icon(
                                Icons.remove,
                                color: AppColors.whiteColor,
                                size: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    const SummaryTextField(
                      fieldTitle: 'SUBTOTAL',
                      fieldText: '\$125.00',
                    ),
                    const SummaryTextField(
                      fieldTitle: 'YOUR COMMISSION',
                      fieldText: '\$20.000',
                      fieldTextColor: AppColors.greenColor,
                    ),
                    const SummaryTextField(
                      fieldTitle: 'TAX (5%)',
                      fieldText: '\$5.00',
                    ),
                    const SizedBox(height: 12),
                    SummaryTextField(
                      fieldTitle: 'TOTAL',
                      fieldText: '\$125.00',
                      fontSize: 17.sp,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Divider(
                color: AppColors.strokeColor,
                thickness: 1.1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ADD SERVICE',
                      textScaler: const TextScaler.linear(1),
                      style: textTheme.bodyMedium!.copyWith(
                        color: AppColors.whiteColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const CircleAvatar(
                        radius: 12,
                        backgroundColor: AppColors.primaryColor,
                        child: Icon(
                          Icons.add,
                          color: AppColors.whiteColor,
                          size: 21,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: AppColors.strokeColor,
                thickness: 1.1,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 1,
                padding: const EdgeInsets.symmetric(horizontal: 0),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const SummaryProductWidget();
                },
              ),
              const Divider(
                color: AppColors.strokeColor,
                thickness: 1.1,
              ),
              const SizedBox(height: 18),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                    'TOTAL',
                    textScaler: const TextScaler.linear(1),
                    style: textTheme.bodyLarge!.copyWith(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              Button(
                label: 'Proceed to Payment',
                width: mqr.width * 0.88,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SummaryTextField extends StatelessWidget {
  const SummaryTextField({
    super.key,
    this.fieldTitle = '',
    this.fieldText = '',
    this.fieldTextColor = AppColors.whiteColor,
    this.fontSize,
  });

  final String fieldTitle;
  final String fieldText;
  final Color fieldTextColor;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            fieldTitle,
            textScaler: const TextScaler.linear(1),
            style: textTheme.titleMedium!.copyWith(
              color: fontSize != null
                  ? AppColors.whiteColor
                  : AppColors.whiteColor.withOpacity(0.7),
              fontWeight: FontWeight.w700,
              fontSize: fontSize ?? 12.sp,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerRight,
              child: Text(
                fieldText,
                maxLines: 1,
                textScaler: const TextScaler.linear(1),
                style: textTheme.bodySmall!.copyWith(
                  color: fieldTextColor,
                  fontSize: fontSize ?? 13.5.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SummaryProductWidget extends StatelessWidget {
  const SummaryProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
