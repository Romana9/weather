import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'app_cubit_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppCubitInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  int ButtonIndex = 0;

  ButtonsIndex(index) {
    ButtonIndex = index;
    emit(ButtonIndexState());
  }

  Map? location;
  Map? current;
  Map? forcast;
  List? forcastDays;

  Future getWeather() async {
    try {
      emit(GetWeatherLoading());
      http.Response response = await http.get(Uri.parse(
          "http://api.weatherapi.com/v1/forecast.json?key=15d444399eb544c0ac9164352231802&q=cairo&days=10"));
      var data = jsonDecode(response.body);
      location = data["location"];
      current = data["current"];
      forcast = data["forecast"]["forecastday"][0];
      forcastDays = data["forecast"]["forecastday"];
      print(location);
      print(current);
      print(forcast);
      emit(GetWeatherSuccess());
    } catch (e) {
      print(e.toString());
    }
  }
}
