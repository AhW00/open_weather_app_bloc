import 'package:flutter/material.dart';
import 'package:open_weather_cubit_stream_subscription/cubits/weather/weather_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather_cubit_stream_subscription/widgets/error_dialog.dart';
import '../cubits/weather/weather_state.dart';
import 'search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Weather'),
          actions: [
            IconButton(
                onPressed: () async {
                  _city = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                  print('city: $_city');
                  if (_city != null) {
                    context.read<WeatherCubit>().fetchWeather(_city!);
                  }
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: BlocConsumer<WeatherCubit, WeatherState>(
          listener: (context, state) {
            if (state.status == WeatherStatus.error) {
              errorDialog(context, state.error.errMsg);
            }
          },
          builder: buildBody,
        ));
  }
}

Widget buildBody(BuildContext context, WeatherState state) {
  if (state.status == WeatherStatus.initial) {
    return Center(
      child: Text('Select a city'),
    );
  }
  if (state.status == WeatherStatus.loading) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  if (state.status == WeatherStatus.error && state.weather.name == '') {
    return Center(
      child: Text('Select a city'),
    );
  }

  return Center(
    child: Text(
      state.weather.name,
      style: TextStyle(fontSize: 18.0),
    ),
  );
}
