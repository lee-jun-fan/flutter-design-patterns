import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:test_flutter_online/bloc/weather_event.dart';
import 'package:test_flutter_online/bloc/weather_state.dart';
import 'package:test_flutter_online/model/weather.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  @override
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    try {
      if (event is FetchWeather && state is WeatherInitial) {
        final fetchData = await _fetch();
        yield WeatherLoaded(fetchData);
      } else if (state is WeatherLoaded) {
        yield WeatherFinish();
      }
    } catch (e) {
      yield WeatherError(e.toString());
    }
  }

  Future<List<Weather>> _fetch() async {
    final todos = await http.get("https://jsonplaceholder.typicode.com/todos");
    final todoData = convert.jsonDecode(todos.body) as List;
    return todoData.map((f)=>Weather.fromMap(f)).toList();
  }
}
