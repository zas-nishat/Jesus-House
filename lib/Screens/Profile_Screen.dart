import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widgets/CustomBackgroundImage.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    _nameController.text = prefs.getString('name') ?? 'Nishat';
    _emailController.text = prefs.getString('email') ?? 'myemail@gmail.com';
    _numberController.text = prefs.getString('number') ?? '+012 345 67 89';
  }

  Future<void> _saveProfileData() async {
    if (_formKey.currentState!.validate()) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', _nameController.text);
      await prefs.setString('email', _emailController.text);
      await prefs.setString('number', _numberController.text);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile information updated')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomBackgroundimage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            title: const Text("Profile"),
            actions: [
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Logged out'),
                    ),
                  );
                },
                child: const Text("Log out"),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 15,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Update info",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Change Password'),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Change Password",
                                  style: TextStyle(color: Colors.orange),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter your name";
                                }
                                return null;
                              },
                              controller: _nameController,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                hintText: "User Name",
                                prefixIcon: const Icon(Icons.person, color: Colors.orange),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(color: Colors.grey),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter email";
                                }
                                return null;
                              },
                              controller: _emailController,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                hintText: "Email Address",
                                prefixIcon: const Icon(Icons.email, color: Colors.orange),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(color: Colors.grey),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter Number";
                                }
                                return null;
                              },
                              controller: _numberController,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                hintText: "Phone Number",
                                prefixIcon: const Icon(Icons.phone, color: Colors.orange),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(color: Colors.grey),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _saveProfileData,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orange,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Center(
                            child: Text(
                              "Update info",
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
