import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRoundedButton extends StatelessWidget {
  CustomRoundedButton({
    super.key,
    required this.buttonText,
    this.backgroundColor,
    this.buttonTextColor,
    this.outBorderColor,
    this.outBorderWidth,
    required this.onPressed,
    required this.heroTag,
  });

  final String buttonText;
  final void Function()? onPressed;
  Color? buttonTextColor = Colors.white;
  final Color? backgroundColor;
  final Object heroTag;
  Color? outBorderColor = const Color(0xffFc6011);
  double? outBorderWidth = 0;

  @override
  Widget build(BuildContext context) {
    Color kPrimaryColor =  Colors.blueAccent;
    return SizedBox(
      width: double.infinity,
      height: 50.0.h,
      child: FloatingActionButton.extended(
        heroTag: heroTag,
        label: Text(
          buttonText,
          style: TextStyle(
            color: buttonTextColor,
            fontSize: 25.0.sp,
            fontWeight: FontWeight.bold,

          ),
        ),
        backgroundColor: backgroundColor ?? kPrimaryColor,
        onPressed: onPressed,
        shape: OutlineInputBorder(
          borderSide: BorderSide(
            color: outBorderColor ?? kPrimaryColor,
            width: outBorderWidth ?? 0,
          ),
          borderRadius: BorderRadius.circular(28.0.r),
        ),
      ),
    );
  }
}
