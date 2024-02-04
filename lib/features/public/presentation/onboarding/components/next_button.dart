import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_service/core/consts/app_colors.dart';
import 'package:in_service/core/widget/button/button_animation.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onTap;
  const NextButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonAnimation(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.h),
        decoration: const BoxDecoration(
          color: KColors.primary,
          shape: BoxShape.circle
        ),
        child: Icon(
          Icons.navigate_next,
          size: 30.w,
          color: KColors.white,
        ),
      ),
    );
  }
}
