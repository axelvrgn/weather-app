// ignore_for_file: prefer_final_fields, avoid_unnecessary_containers

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/ui/views/big_container.dart';
import 'package:weather_app/ui/views/home.dart';

import '../../utilities/constant.dart';
import '../../utilities/utilities.dart';
import 'on_boarding.dart';

// ignore: must_be_immutable
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // navigationPage();
    });
  }

  void redirect() {
    if (1 == 1) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const OnboardingScreen()));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const BigContainer()));
    }
  }

  @override
  Widget build(BuildContext context) {
    stateControl(context);
    return WillPopScope(
      onWillPop: () => Utilities().confirmExitDialog(context, true),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: PURPLE_DEGRADE_2_COLOR,
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Image(
                      image: AssetImage("assets/images/full-logo.png"),
                      height: 80,
                      width: 220,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    child: const CircularProgressIndicator(
                      strokeWidth: 1.5,
                      color: PURPLE_COLOR,
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}

void stateControl(BuildContext context) {
  Timer(
      const Duration(seconds: 3),
      () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const HomePage()))
          });
}
