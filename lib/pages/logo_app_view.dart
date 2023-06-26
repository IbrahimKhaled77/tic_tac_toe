import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/pages/home_tac_view.dart';

class LogoAppView extends StatelessWidget {
  const LogoAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: RichText(
        text: const TextSpan(children: [
          TextSpan(
              text: 'Tic',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 60,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: 'Tac',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 60,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: 'Toe',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 60,
                  fontWeight: FontWeight.bold)),
        ]),
      ),
      nextScreen: const HomeTacView(),
      curve: Curves.fastOutSlowIn,
      backgroundColor: Colors.blue.withOpacity(0.25),
      animationDuration: const Duration(seconds: 3),
      splashTransition: SplashTransition.slideTransition,
    );
  }
}
