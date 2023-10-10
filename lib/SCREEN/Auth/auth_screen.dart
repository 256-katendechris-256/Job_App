import 'package:flutter/material.dart';
import 'package:konnet/SCREEN/Auth/login_screen.dart';
import 'package:konnet/SCREEN/Auth/register_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.blueGrey,

                    ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops:  [0.0,1.0],
                  tileMode: TileMode.clamp,


                )
              ),
            ),
            automaticallyImplyLeading: false,
            title: const Text(
                "kONNe",
              style: TextStyle(
                fontSize: 40,
                color: Colors.blue,
                fontFamily: "Lobster",
              ),
            ),
            centerTitle: true,

            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.lock,color: Colors.blue,),
                  text: "Login",
                ),
                Tab(
                  icon: Icon(Icons.person,color: Colors.blue,),
                  text: "Register",
                )
              ],
              indicatorColor: Colors.white,
              indicatorWeight: 3,

            ),
          ),
          body:   Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft, colors: [
                  Colors.blueGrey,
                  Colors.white,
              ],
              )
            ),
            child: const TabBarView(
              children: [
                LoginScreen(),
                RegisterScreen()


              ],
            ),
          ),
        ));
  }
}
