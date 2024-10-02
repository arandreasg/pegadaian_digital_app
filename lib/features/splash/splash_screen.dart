import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pegadaian_digital/features/home_screen.dart';
import 'package:pegadaian_digital/features/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
void initState(){
  super.initState();
  Future.delayed(const Duration(milliseconds: 2000),(){
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(builder: (_) => const OnBoardingPage()));
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset("assets/images/svg/splash_icon.svg"),
      ),
    ) ;
  }
}