import 'dart:async';

import 'package:flutter/material.dart';
import 'package:konnet/SCREEN/Auth/auth_screen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {

  startTimer(){
    //time to take wen screen is loading
    Timer(const Duration(seconds: 5),() async{
      Navigator.push(context, MaterialPageRoute(builder: (c)=>const AuthScreen()));
    });

  }

  @override
  void initState() {
       super.initState();

       startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      // the splash screen
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset("images/2.png"),
              ),
              const SizedBox(height: 10,),

              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                    "Provide Services Online",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 40,
                    fontFamily: "Signatra",
                    letterSpacing: 3,
                  ),

                ),

              )
            ],
          ),
        ),
      ),
    );
  }
}
