
import 'package:city_church_app/Auth_Screens/ForgotPassword_Screen.dart';
import 'package:city_church_app/Screens/Home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/CustomBackgroundImage.dart';


class LoginScreen extends StatefulWidget {
  final Function() onTap;
  const LoginScreen({Key? key, required this.onTap}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future signIn() async {}

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomBackgroundimage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                    ),
                    Center(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset("Assets/applogo.jpg",height: 100,colorBlendMode: BlendMode.darken,color: Colors.black.withOpacity(0.1),))),
                    Center(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Jesus ',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: GoogleFonts.notoSansBassaVah()
                                          .fontFamily,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'House',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: GoogleFonts.notoSansBassaVah()
                                          .fontFamily,
                                    ),
                                  ),
                                ],
                              ),
                            ))),

                    ///Register now text
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 30.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Divider(
                            thickness: 2,
                            color: Colors.orange,
                          )),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.0),
                            child: Text(
                              "Sign in now",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Expanded(
                              child: Divider(
                            thickness: 2,
                            color: Colors.orange,
                          )),
                        ],
                      ),
                    ),

                    //email
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your email';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailController,
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 10),
                                  hintText: "Email Addres",
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide:
                                          const BorderSide(color: Colors.grey)),
                                  border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                          ),
                          //password
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter password";
                                }
                                return null;
                              },
                              controller: _passwordController,
                              decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      Get.to(ForgotpasswordScreen());
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 60,
                                      child: const Text(
                                        "Forgot ?",
                                        style: TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  contentPadding:
                                      const EdgeInsets.only(left: 10),
                                  hintText: "Password",
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide:
                                          const BorderSide(color: Colors.grey)),
                                  border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //login button
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate());
                        signIn();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.orange),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Center(
                              child: Text(
                                "Sign in",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //create account
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25.0),
                      child: GestureDetector(
                        onTap: widget.onTap,
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "New user?",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Register Now",
                                style:
                                    TextStyle(color: Colors.orange, fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
