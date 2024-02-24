import 'package:acm_test/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    required this.textEditingController,
    this.onChanged,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.textCapitalization = TextCapitalization.none,
    this.suffix,
    this.prefix,
    this.readOnly = false,
    this.onTap,
    this.inputFormatters,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.bottomSpacing = true,
    this.maxLength,
    this.autofocus = false,
    this.hintColor = AppColors.greyColor3,
    this.fillColor = AppColors.deepBackGroundColor,
    this.textInputColor = AppColors.greyColor3,
    this.borderColor,
    this.focusedBorderColor,
    this.height,
    this.helperText,
    this.helperColor,
    this.fontSize,
  });

  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final TextInputAction? textInputAction;
  final TextEditingController textEditingController;
  final bool obscureText;
  final TextInputType keyboardType;
  final int maxLines;
  final TextCapitalization textCapitalization;
  final Widget? suffix;
  final Widget? prefix;
  final bool readOnly;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autoValidateMode;
  final bool? bottomSpacing;
  final int? maxLength;
  final bool autofocus;
  final Color hintColor;
  final Color fillColor;
  final Color textInputColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final double? height;
  final String? helperText;
  final Color? helperColor;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        SizedBox(
          height: height,
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              TextFormField(
                controller: textEditingController,
                onChanged: onChanged,
                validator: validator,
                obscureText: obscureText,
                maxLines: maxLines,
                cursorColor: AppColors.primaryColor,
                autovalidateMode: autoValidateMode,
                readOnly: readOnly,
                maxLength: maxLength,
                textInputAction: textInputAction,
                autofocus: autofocus,
                textCapitalization: textCapitalization,
                keyboardType: keyboardType,
                autocorrect: false,
                style: textTheme.bodyMedium!.copyWith(
                  fontSize: fontSize ?? 16.sp,
                  fontWeight: FontWeight.w500,
                  color: textInputColor,
                ),
                onTap: onTap,
                inputFormatters: inputFormatters,
                decoration: InputDecoration(
                  suffixIcon: suffix,
                  // suffix: suffix,
                  prefixIcon: prefix,
                  hintText: hintText,
                  hintStyle: textTheme.bodyMedium!.copyWith(
                    color: AppColors.greyColor3,
                    fontWeight: FontWeight.w500,
                  ),
                  labelText: labelText,
                  labelStyle: textTheme.bodyMedium!.copyWith(
                    color: AppColors.greyColor3,
                    fontWeight: FontWeight.w500,
                  ),
                  focusColor: AppColors.primaryColor,
                  fillColor: fillColor,
                  filled: true,
                  contentPadding: const EdgeInsets.fromLTRB(15, 23, 3, 16),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    borderSide:
                        BorderSide(color: borderColor ?? AppColors.strokeColor),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    borderSide:
                        BorderSide(color: borderColor ?? AppColors.strokeColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    borderSide:
                        BorderSide(color: borderColor ?? AppColors.strokeColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                        color: focusedBorderColor ?? AppColors.greyColor),
                  ),
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: bottomSpacing ?? false,
          child: const SizedBox(height: 28),
        ),
      ],
    );
  }
}

class CustomPasswordFormField extends HookWidget {
  const CustomPasswordFormField({
    required this.textEditingController,
    this.labelText,
    this.validator,
    this.textFieldName,
    this.hintText,
    this.textInputAction,
    this.isBottomSpacing = true,
    super.key,
  });

  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final String? labelText;
  final String? textFieldName;
  final String? hintText;
  final bool isBottomSpacing;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    final obscureText = useState(true);
    return CustomTextFormField(
      labelText: labelText,
      textEditingController: textEditingController,
      obscureText: obscureText.value,
      bottomSpacing: isBottomSpacing,
      hintText: hintText,
      textInputAction: textInputAction,
      validator: validator,
      suffix: InkWell(
        onTap: () => obscureText.value = !obscureText.value,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Icon(
            !obscureText.value ? Iconsax.eye4 : Iconsax.eye_slash5,
            size: 17.sp,
            color: AppColors.greyColor3,
          ),
        ),
      ),
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
    );
  }
}
