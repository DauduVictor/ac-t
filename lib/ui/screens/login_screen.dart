import 'package:acm_test/ui/ui.dart';
import 'package:acm_test/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends HookWidget {
  static const String id = 'loginScreen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final formKey = useState(GlobalKey<FormState>());
    final emailAddressController = useTextEditingController();
    final passwordController = useTextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top + 15.h),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Sign up',
                    textScaler: const TextScaler.linear(1),
                    style: textTheme.bodyLarge!.copyWith(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 31.h),
              Text(
                'Log in',
                textScaler: const TextScaler.linear(1),
                style: textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Make sure your information is accurate',
                textScaler: const TextScaler.linear(1),
                style: textTheme.bodyLarge!.copyWith(
                  color: AppColors.greyColor2,
                ),
              ),
              SizedBox(height: 35.h),
              Form(
                key: formKey.value,
                child: Column(
                  children: [
                    CustomTextFormField(
                      labelText: 'Email',
                      textEditingController: emailAddressController,
                      validator: ValidationExtension.validateEmailAddress,
                      keyboardType: TextInputType.text,
                    ),
                    CustomPasswordFormField(
                      labelText: 'Password',
                      textInputAction: TextInputAction.done,
                      textEditingController: passwordController,
                      validator: ValidationExtension.validateFieldNotEmpty,
                      isBottomSpacing: false,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    textScaler: const TextScaler.linear(1),
                    style: textTheme.bodyMedium!.copyWith(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              Button(
                label: 'Continue',
                width: mqr.width,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AllProducts.id,
                    (route) => false,
                  );
                  // if (formKey.value.currentState!.validate()) {
                  //   // authCubit.loginUser(
                  //   //   email: _emailAddressController.text.trim(),
                  //   //   password: _passwordController.text.trim(),
                  //   // );
                  // }
                },
              ),
              const SizedBox(height: 14),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}
