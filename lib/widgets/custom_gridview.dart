import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGridview extends StatelessWidget {
  const CustomGridview({
    super.key,
    required this.image,
    required this.title,
    required this.text1,
  });
  final String image;
  final String title;
  final String text1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      width: 182.w,
      decoration: BoxDecoration(
        color: const Color(0xffD0BCFF),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(11.h),
        child: Stack(children: [
          Row(
            children: [
              Container(
                height: 28.h,
                width: 28.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(200.r)),
                child: Center(
                  child: Image.asset(
                    image,
                    height: 16.h,
                    width: 16.w,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 14.sp)),
                  SizedBox(height: 8.h),
                  Text(text1, style: TextStyle(fontSize: 16.sp)),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
