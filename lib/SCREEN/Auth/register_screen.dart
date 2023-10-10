import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:konnet/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController nameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();
  TextEditingController locationController=TextEditingController();


  XFile? imageXFile;
  final ImagePicker _picker = ImagePicker();

  Position? position;
  List<Placemark>? placeMarks;

  Future<void> _getImage() async
  {
    imageXFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageXFile;
    });
  }

  getCurrentLocation() async
  {
    Position newPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    position = newPosition;
    placeMarks = await placemarkFromCoordinates(
        position!.latitude,
        position!.longitude,
    );
    Placemark pMark =placeMarks![0];

    String completeAddress ='${pMark.subThoroughfare} ${pMark.thoroughfare},${pMark.subLocality} ${pMark.locality}, ${pMark.subAdministrativeArea},${pMark.administrativeArea} ${pMark.postalCode}, ${pMark.country}';

    locationController.text = completeAddress;
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 10,),
            InkWell(
              // users will insert the company pic or logo
              onTap: (){
                _getImage();
              },
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width*0.20,
                backgroundColor: Colors.white,
                backgroundImage: imageXFile==null ? null : FileImage(File(imageXFile!.path)),// can get image from gallery and saved to this variable
                child: imageXFile==null?
                    Icon(
                      Icons.add_photo_alternate,color: Colors.blue,
                      size:MediaQuery.of(context).size.width*0.20,
                      //color: Colors.grey,
                    ):null,
              ),
            ),
            const SizedBox(height: 10,),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  CustomTextField(
                    data: Icons.person,
                    controller: nameController,
                    hintText: "Company name",
                    isObsecre: false,
                  ),
                  CustomTextField(
                    data: Icons.phone,
                    controller: phoneController,
                    hintText: "phone",
                    isObsecre: false,
                  ),
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
                  CustomTextField(
                    data: Icons.lock,
                    controller: confirmPasswordController,
                    hintText: "Confirm Password",
                    isObsecre: false,
                    enabled: true,
                  ),
                  CustomTextField(
                    data: Icons.my_location_sharp,
                    controller: locationController,
                    hintText: "location",
                    isObsecre: false,
                    enabled: true,
                  ),
                  Container(
                    width: 400,
                    height: 40,
                    alignment: Alignment.center,
                    child: ElevatedButton.icon(
                        onPressed: (){

                          getCurrentLocation();

                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.indigo,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )
                        ),
                        icon: const Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        label: const Text(
                          "Get my current location",
                          style: TextStyle(color: Colors.white),
                        )
                    ),
                  )

                ],
              ),

            ),
            const SizedBox(height: 10,),
            ElevatedButton(
                onPressed: ()=>print("clicked") ,
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,fontWeight: FontWeight.bold,
                  ),
                ),
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10)
              ),
            ),
            const SizedBox(height: 30,),


          ],
        ),


      ),
    );
  }
}


