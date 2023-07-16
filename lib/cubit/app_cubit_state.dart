part of 'app_cubit_cubit.dart';

@immutable
abstract class AppState {}

class AppCubitInitial extends AppState {}

class ButtonIndexState extends AppState {}

class GetWeatherLoading extends AppState {}

class GetWeatherSuccess extends AppState {}
