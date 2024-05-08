import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox gapW(double value) {
  return SizedBox(
    width: value.w,
  );
}

SizedBox gapH(double value) {
  return SizedBox(
    height: value.h,
  );
}

SizedBox gap(double width, double height) {
  return SizedBox(
    width: width.w,
    height: height.h,
  );
}
