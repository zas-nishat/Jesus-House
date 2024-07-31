import 'package:flutter/material.dart';

class CustomBackgroundimage extends StatelessWidget {
  const CustomBackgroundimage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage("Assets/church_img.png"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7), BlendMode.darken))),
    );
  }
}
