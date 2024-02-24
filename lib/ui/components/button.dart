import 'package:acm_test/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  final Color labelColor;
  final Color? color;
  final Widget? child;
  final double? width;
  final bool isBoldLabelText;
  final bool enabled;

  const Button({
    super.key,
    required this.label,
    required this.onPressed,
    this.labelColor = AppColors.whiteColor,
    this.child,
    this.color,
    this.width,
    this.isBoldLabelText = true,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: enabled ? 1 : 0,
        padding: const EdgeInsets.symmetric(vertical: 17),
        backgroundColor:
            enabled ? color ?? AppColors.primaryColor : AppColors.greyColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        side: enabled ? null : const BorderSide(color: AppColors.primaryColor),
      ),
      onPressed: onPressed,
      child: IntrinsicWidth(
        child: SizedBox(
          width: width,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: FittedBox(
                child: Row(
                  children: [
                    child ??
                        Text(
                          label,
                          textScaler: const TextScaler.linear(1),
                          style: textTheme.bodyLarge!.copyWith(
                            color: enabled ? labelColor : AppColors.whiteColor,
                            fontWeight: isBoldLabelText
                                ? FontWeight.w600
                                : FontWeight.w500,
                          ),
                        ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
