import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:weather/cubit/app_cubit_cubit.dart';

class CustomPercentListview extends StatelessWidget {
  const CustomPercentListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Map> list = [
      {
        "time": "1 AM",
        "percent1": "27%",
        "percent2": 0.27,
      },
      {
        "time": "9 AM",
        "percent1": "45%",
        "percent2": 0.45,
      },
      {
        "time": "2 PM",
        "percent1": "10%",
        "percent2": 0.1,
      },
      {
        "time": "9 PM",
        "percent1": "90%",
        "percent2": 0.9,
      },
    ];
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 15.h),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 11.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(list[index]["time"],
                        style: TextStyle(fontSize: 15.sp)),
                    LinearPercentIndicator(
                      width: 229.w,
                      animation: true,
                      lineHeight: 24.h,
                      animationDuration: 2000,
                      percent: list[index]["percent2"],
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      barRadius: const Radius.circular(10),
                      progressColor: const Color(0xff8A20D5),
                      backgroundColor: const Color.fromARGB(59, 138, 32, 213),
                    ),
                    Text(list[index]["percent1"],
                        style: TextStyle(fontSize: 15.sp)),
                  ],
                ),
              );
            });
      },
    );
  }
}
