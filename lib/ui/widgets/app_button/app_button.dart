import 'package:flutter/material.dart';
import 'package:world_skills_project/ui/widgets/app_color/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    this.width,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.child,
    this.isLoading = false,
    required this.onPressed,
    this.isEnable = true,
    this.formState,
    this.isFontSize = false,
  });
  final String text;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final BorderRadius? borderRadius;
  final Widget? child;
  final bool isLoading;
  final Function() onPressed;
  final bool isEnable;
  final FormState? formState;
  final bool isFontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isEnable) {
          if (!isLoading) {
            if (formState == null) {
              onPressed();
            } else {
              if (formState?.validate() == true) {
                onPressed();
              }
            }
          }
        }
      },
      child: AnimatedContainer(
        height: height ?? 54,
        width: width ?? double.infinity,
        duration: Duration(seconds: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isEnable ? backgroundColor : AppColor.greyDark,
        ),
        alignment: Alignment.center,
        child:
            isLoading!
                ? CircularProgressIndicator(color: AppColor.primaryColor)
                : Text(
                  text,
                  style: TextStyle(
                    fontSize: isFontSize == true ? 14 : 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.white,
                  ),
                ),
      ),
    );
  }
}
