import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:pln/utility/style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String dvlp = "PLTU Nagan - PLN Persero";

  @override
  void initState() {
    super.initState();
    holdTimer();
    dvlp = String.fromCharCodes(inp.runes.toList().reversed);
  }

  holdTimer() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, toMain);
  }

  toMain() {
    checkLoginStatus();
  }

  checkLoginStatus() async {
    // const dynamic token = null;
    bool isLoggedIn =
        await SessionManager().get("isLoggedIn") != null ? true : false;
    if (isLoggedIn) {
      Navigator.of(context).pushNamedAndRemoveUntil('/main', (route) => false);
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/pln-logo.png',
                    height: 80,
                  ),
                  const SizedBox(height: 20),
                  const CircularProgressIndicator(
                    color: Colors.white24,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Sedang memuat..',
                    style: TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: SizedBox(
                  height: 30,
                  child: Text(
                    dvlp,
                    style: const TextStyle(color: grayTextColor, fontSize: 11),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
