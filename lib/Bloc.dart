import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_online/bloc/weather_bloc.dart';
import 'package:test_flutter_online/bloc/weather_state.dart';
import 'package:test_flutter_online/bloc/weather_event.dart';

class BlocEg extends StatefulWidget {
  @override
  _BlocEgState createState() => _BlocEgState();
}

class _BlocEgState extends State<BlocEg> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<WeatherBloc>(context)..add(FetchWeather());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bloc Example"),
        ),
        body: BlocBuilder<WeatherBloc, WeatherState>(builder: (cxt, state) {
          if (state is WeatherInitial) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoaded) {
            if (state.weather.isEmpty) {
              return Text("No Data");
            } else {
              return ListView.builder(
                itemBuilder: (cxt, index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: Text(state.weather[index].result),
                  );
                },
                itemCount: state.weather.length,
              );
            }
          } else if (state is WeatherError) {
            return Text(state.errMsg.toString());
          }
          return null;
        }));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    BlocProvider.of<WeatherBloc>(context).close();
    super.dispose();
  }
}
