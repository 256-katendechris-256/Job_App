import 'package:flutter/material.dart';
import 'package:konnet/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});




  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Image.asset(
              "images/y2.jpeg",
              height: 270,
            ),
          ),
          Form(
            key: _formkey,
            child: Column(
              children: [

                CustomTextField(
                  data: Icons.email,
                  controller: emailController,
                  hintText: "Email",
                  isObsecre: false,
                ),
                CustomTextField(
                  data: Icons.lock,
                  controller: passwordController,
                  hintText: "Password",
                  isObsecre: false,
                  enabled: true,
                ),




              ],
            ),

          ),
          ElevatedButton(
            onPressed: ()=>print("clicked") ,
            child: const Text(
              "Login",
              style: TextStyle(
                color: Colors.white,fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10)
            ),
          ),
          const SizedBox(height: 30,),

        ],
      ),
    );
  }
}
