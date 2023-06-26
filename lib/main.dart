import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/pages/logo_app_view.dart';

import 'controller/cubit/cubit_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        // Set the status bar color
        statusBarIconBrightness: Brightness.light,
        // Set the status bar icons color (dark icons)
        statusBarBrightness:
            Brightness.light, // Set the status bar content (light content)
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.blue.withOpacity(0.25),
        ),
        home: const LogoAppView(),
      ),
    );
  }
}
