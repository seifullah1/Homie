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
      onTap:
          isEnable && !isLoading
              ? () {
                if (formState == null || formState?.validate() == true) {
                  onPressed();
                }
              }
              : null,
      child: AnimatedContainer(
        height: height ?? 54,
        width: width ?? double.infinity,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
          color:
              isEnable
                  ? backgroundColor ?? AppColor.primaryColor
                  : AppColor.greyDark,
        ),
        alignment: Alignment.center,
        child:
            isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : Text(
                  text,
                  style: TextStyle(
                    fontSize: isFontSize ? 14 : 16,
                    fontWeight: FontWeight.bold,
                    color: textColor ?? AppColor.white,
                  ),
                ),
      ),
    );
  }
}
