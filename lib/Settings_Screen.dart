import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Widgets/CustomAppBarDrawer.dart';
import 'Widgets/CustomBackgroundImage.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = Get.isDarkMode;
  int selectedLanguageIndex = -1; // Add a variable to keep track of the selected language card

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomBackgroundimage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text("Settings"),
          ),
          drawer: const CustomAppBarDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Display Settings",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                ),),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Dark Mode",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                          ),),
                          Transform.scale(
                            scale: 0.75, // Adjust the scale as needed
                            child: Switch(
                              activeColor: Colors.orange,
                              value: isDarkMode,
                              onChanged: (value) {
                                setState(() {
                                  isDarkMode = value;
                                });
                                Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
                              },
                            ),
                          )
                        ],
                      ),
                      Text("Experience an exciting dark mode",style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade400
                      ),)
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Select Language",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                ),),
              ),
              // Create a list of language cards
              _buildLanguageCard(0, "Bangla"),
              _buildLanguageCard(1, "English"),
              _buildLanguageCard(2, "French"),
              _buildLanguageCard(3, "Spanish"),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildLanguageCard(int index, String language) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLanguageIndex = index;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(
                seconds: 1
              ),
              content: Text("$language is selected")
            ),
          );
        });
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(language, style: const TextStyle(fontSize: 19)),
              if (selectedLanguageIndex == index)
                const Icon(CupertinoIcons.globe, color: Colors.orange),
            ],
          ),
        ),
      ),
    );
  }
}
