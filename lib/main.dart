import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weather/providers/weather_provider.dart';
import 'cubit/app_cubit_cubit.dart';
import 'pages/splash_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 892),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return BlocProvider(
          create: (context) => AppCubit()..getWeather(),
          child: ChangeNotifierProvider(
            create: (context) {
              return WeatherProvider();
            },
            child: const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SplashView(),
            ),
          ),
        );
      },
    );
  }
}
