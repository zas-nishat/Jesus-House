import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Widgets/CustomBackgroundImage.dart';

class RegistrationScreen extends StatefulWidget {
  final Function()? onTap;
  const RegistrationScreen({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future signUp() async {}


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomBackgroundimage(),
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
                onPressed: widget.onTap,
                icon: const Icon(Icons.arrow_back_ios_new)),
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

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

                    ///Sign in now text
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
                              "Register now",
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
                                  return 'Enter your name';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              controller: _userNameController,
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 10),
                                  hintText: "User Name",
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
                                  hintText: "Email Address",
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
                                  contentPadding:
                                      const EdgeInsets.only(left: 10),
                                  hintText: "Create Password",
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
                        if (_formKey.currentState!.validate()) ;
                        signUp();
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
                                "Register Now",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
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
