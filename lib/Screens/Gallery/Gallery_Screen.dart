import 'package:city_church_app/Screens/Gallery/GalleryVideos_Screen.dart';
import 'package:city_church_app/Widgets/CustomAppBarDrawer.dart';
import 'package:city_church_app/Widgets/CustomBackgroundImage.dart';
import 'package:flutter/material.dart';

import 'GalleryPictures_Screen.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomBackgroundimage(),
        DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: const Text("Gallery"),
              bottom: const TabBar(
                tabs: [
                  Tab(text: "Pictures"),
                  Tab(text: "Videos"),
                ],
              ),
            ),
            drawer: CustomAppBarDrawer(),
            body: TabBarView(
              children: [
                GalleryPictures_Screen(),
                GalleryVideos_Screen()
              ],
            ),
          ),
        ),
      ],
    );
  }
}




