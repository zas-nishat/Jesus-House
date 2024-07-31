import 'package:city_church_app/Screens/About_Screen.dart';
import 'package:city_church_app/Screens/Contact_Screen.dart';
import 'package:city_church_app/Screens/Events/Event_Screen.dart';
import 'package:city_church_app/Screens/Gallery/Gallery_Screen.dart';
import 'package:city_church_app/Screens/Home_Screen.dart';
import 'package:city_church_app/Screens/LiveStreaming_Screen.dart';
import 'package:city_church_app/Screens/News/News_Screen.dart';
import 'package:city_church_app/Screens/Prayers/Prayers_Screen.dart';
import 'package:city_church_app/Settings_Screen.dart';
import 'package:city_church_app/Widgets/CustomDrawerTiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBarDrawer extends StatelessWidget {
  const CustomAppBarDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  HomeScreen()));
              },
              child: ListTile(
                leading: Icon(Icons.home,color: Colors.orange,),
                title: Text("Back to Home",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.orange
                ),),
              ),
            ),
            Divider(),
            Customdrawertiles(
                icon: Icons.event,
                title: "Events",
                subtitle: "List of events",
                onTap: () {
                  Get.to(EventScreen());
                }),
            Customdrawertiles(
                image: "prayer.svg",
                title: "Prayers",
                subtitle: "Read prayers",
                onTap: () {
                  Get.to(PrayersScreen());
                }),
            Customdrawertiles(
                icon: Icons.image,
                title: "Gallary",
                subtitle: "Videos and Pictures",
                onTap: () {
                  Get.to(GalleryScreen());
                }),
            Customdrawertiles(
                icon: Icons.newspaper,
                title: "News",
                subtitle: "Read church's blogs",
                onTap: () {
                  Get.to(NewsScreen());
                }),
            // Customdrawertiles(
            //     icon: Icons.school,
            //     title: "Inventory",
            //     subtitle: "View inventory",
            //     onTap: () {
            //       Get.to(ProductFormPage());
            //     }),

            Customdrawertiles(
                icon: Icons.live_tv,
                title: "Live Stream",
                subtitle: "Watch live",
                onTap: () {
                  Get.to(LiveStreamingScreen());
                }),

            Customdrawertiles(
                icon: Icons.email,
                title: "Contact",
                subtitle: "Message to church",
                onTap: () {
                  Get.to(ContactScreen());
                }),
            Customdrawertiles(
                icon: Icons.settings,
                title: "Settings",
                subtitle: "Set your preferences",
                onTap: () {
                  Get.to(SettingsScreen());
                }),
            Customdrawertiles(
                icon: Icons.church,
                title: "About us",
                subtitle: "Read about church",
                onTap: () {
                  Get.to(AboutScreen());
                }),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
