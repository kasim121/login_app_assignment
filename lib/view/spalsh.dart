import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  startTimr() {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  void route() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  void initState() {
    startTimr();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: content(),
    );
  }

  Widget content() {
    return Center(
      child: Container(
          child: Lottie.network(
              'https://lottie.host/67cf536e-d1ab-45db-8e9f-b6b9daebe43b/BfRAsetJr2.json')),
    );
  }
}
