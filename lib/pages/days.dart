import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubit/app_cubit_cubit.dart';

class Days extends StatelessWidget {
  const Days({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: const Color(0xffF6EDFF),
            body: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: const Color(0xffF6EDFF),
                    elevation: 0,
                    expandedHeight: 200.h,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                        height: 228.h,
                        width: double.infinity,
                        color: const Color(0xffE1D3FA),
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 23.w, top: 58.h),
                              child: Text(
                                  "${AppCubit.get(context).location!["name"]}, ${AppCubit.get(context).location!["country"]}",
                                  style: TextStyle(fontSize: 24.sp)),
                            ),
                            Positioned(
                              top: 97.h,
                              right: 23.w,
                              child: Image.asset(
                                "assets/images/cloud and sun.png",
                                height: 59.h,
                                width: 59.w,
                              ),
                            ),
                            Positioned(
                              top: 98.h,
                              left: 23.w,
                              child: Text(
                                  "${AppCubit.get(context).current!["temp_c"]}°",
                                  style: TextStyle(fontSize: 57.sp)),
                            ),
                            Positioned(
                              top: 132.h,
                              left: 135.w,
                              child: Text(
                                  "Feels like ${AppCubit.get(context).current!["feelslike_c"]}°",
                                  style: TextStyle(fontSize: 16.sp)),
                            ),
                            Positioned(
                              // top: 173.h,
                              bottom: 10.h,
                              left: 16.w,
                              right: 16.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      AppCubit.get(context).ButtonsIndex(0);
                                    },
                                    child: Container(
                                      height: 42.h,
                                      width: 116.w,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(14.r),
                                      ),
                                      child: Center(
                                        child: Text('Today',
                                            style: TextStyle(fontSize: 16.sp)),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      AppCubit.get(context).ButtonsIndex(1);
                                    },
                                    child: Container(
                                      height: 42.h,
                                      width: 116.w,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(14.r),
                                      ),
                                      child: Center(
                                        child: Text('Tomorrow',
                                            style: TextStyle(fontSize: 16.sp)),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 42.h,
                                    width: 116.w,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffE0B6FF),
                                      borderRadius: BorderRadius.circular(14.r),
                                    ),
                                    child: Center(
                                      child: Text('10 days',
                                          style: TextStyle(fontSize: 16.sp)),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: AppCubit.get(context).forcastDays!.length,
                        padding: EdgeInsets.only(top: 15.h),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: Container(
                              width: double.infinity,
                              height: 84.h,
                              decoration: BoxDecoration(
                                  color: const Color(0xffEBDEFF),
                                  borderRadius: BorderRadius.circular(18.r)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 18.w, vertical: 15.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            AppCubit.get(context)
                                                .forcastDays![index]["date"],
                                            style: TextStyle(fontSize: 16.sp)),
                                        SizedBox(height: 10.h),
                                        Text(
                                            "${AppCubit.get(context).forcastDays![index]["day"]["condition"]["text"]}",
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                color:
                                                    const Color(0xff494649))),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                                "${AppCubit.get(context).forcastDays![index]["day"]["maxtemp_c"]}",
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    color: const Color(
                                                        0xff2E004E))),
                                            SizedBox(height: 10.h),
                                            Text(
                                                "${AppCubit.get(context).forcastDays![index]["day"]["mintemp_c"]}",
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    color: const Color(
                                                        0xff2E004E))),
                                          ],
                                        ),
                                        SizedBox(width: 10.w),
                                        Container(
                                          height: 45.h,
                                          width: 2.w,
                                          color: const Color(0xff4B454D),
                                        ),
                                        SizedBox(width: 10.w),
                                        Image.asset(
                                            "assets/images/cloud and sun 1.png",
                                            height: 54.h,
                                            width: 54.w),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                ]));
      },
    );
  }
}
