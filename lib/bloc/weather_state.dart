import 'package:equatable/equatable.dart';
import 'package:test_flutter_online/model/weather.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final List<Weather> weather;
  WeatherLoaded(this.weather);
}
class WeatherFinish extends WeatherState{}
class WeatherError extends WeatherState{
  final String errMsg;
  WeatherError(this.errMsg);
}
