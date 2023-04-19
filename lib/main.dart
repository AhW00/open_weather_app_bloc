import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:open_weather_cubit_stream_subscription/cubits/theme/theme_cubit.dart';
import 'package:open_weather_cubit_stream_subscription/cubits/weather/weather_cubit.dart';
import 'package:open_weather_cubit_stream_subscription/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather_cubit_stream_subscription/repositories/weather_repository.dart';
import 'package:open_weather_cubit_stream_subscription/services/weather_api_services.dart';
import 'cubits/temp_setting/temp_settings_cubit.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) =>
          WeatherRepository(weatherApiServices: WeatherApiServices()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => WeatherCubit(
              weatherRepository:
                  RepositoryProvider.of<WeatherRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => TempSettingsCubit(),
          ),
          BlocProvider(
            create: (context) =>
                ThemeCubit(weatherCubit: context.read<WeatherCubit>()),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: state.appTheme == AppTheme.light
                  ? ThemeData.light()
                  : ThemeData.dark(),
              home: const HomePage(),
            );
          },
        ),
      ),
    );
  }
}
