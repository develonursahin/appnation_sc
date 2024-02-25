import 'package:appnation_sc/core/routes/routes.dart';
import 'package:appnation_sc/data/services/dog_service.dart';
import 'package:appnation_sc/presentation/home/bloc/home_bloc.dart';
import 'package:appnation_sc/presentation/main/bloc/main_bloc.dart';
import 'package:appnation_sc/presentation/settings/bloc/settings_bloc.dart';
import 'package:appnation_sc/presentation/splash/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashBloc>(
          create: (context) => SplashBloc(DogService(), HomeBloc(DogService())),
        ),
        BlocProvider<MainBloc>(
          create: (BuildContext context) => MainBloc(),
        ),
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => HomeBloc(DogService()),
        ),
        BlocProvider<SettingsBloc>(
          create: (BuildContext context) => SettingsBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'AppDog',
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
