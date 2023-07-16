import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DaysContainer extends StatelessWidget {
  const DaysContainer({
    super.key,
    required this.text, required this.color,
  });
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      width: 116.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Center(
        child: Text(text, style: TextStyle(fontSize: 16.sp)),
      ),
    );
  }
}
