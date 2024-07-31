import 'package:city_church_app/Screens/About_Screen.dart';
import 'package:city_church_app/Screens/Contact_Screen.dart';
import 'package:city_church_app/Screens/LiveStreaming_Screen.dart';
import 'package:city_church_app/Screens/Prayers/Prayers_Screen.dart';
import 'package:city_church_app/Widgets/ImageSlider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Widgets/CustomBackgroundImage.dart';
import '../Widgets/CustomHomeCard.dart';
import 'Events/Event_Screen.dart';
import 'Gallery/Gallery_Screen.dart';
import 'News/News_Screen.dart';
import 'Profile_Screen.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String quotesOfTheDay =
      "At the end of the day, before you close your eyes, be content with what you've done and proud of who you are.";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomBackgroundimage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          // applogopBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   automaticallyImplyLeading: false,
          //   title: RichText(
          //     text: TextSpan(
          //       children: [
          //         TextSpan(
          //           text: 'Jesus ',
          //           style: TextStyle(
          //             fontSize: 25,
          //             fontFamily: GoogleFonts.notoSansBassaVah().fontFamily,
          //           ),
          //         ),
          //         TextSpan(
          //           text: 'House',
          //           style: TextStyle(
          //             fontSize: 25,
          //             fontWeight: FontWeight.bold,
          //             fontFamily: GoogleFonts.notoSansBassaVah().fontFamily,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          //   actions: [
          //     IconButton(
          //       onPressed: () {
          //         Get.to(const ProfileScreen());
          //       },
          //       icon: const Icon(
          //         Icons.person,
          //         color: Colors.orange,
          //       ),
          //     )
          //   ],
          // ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                "Assets/applogo.jpg",
                                height: 50,
                              )),
                          IconButton(
                            onPressed: () {
                              Get.to(const ProfileScreen());
                            },
                            icon: const Icon(
                              size: 30,
                              Icons.person,
                              color: Colors.orange,
                            ),
                          )
                        ],
                      ),
                    ),
                    const ImageSlider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Thought of the day",
                          style: TextStyle(fontSize: 23, color: Colors.orange),
                        ),
                        IconButton(
                          onPressed: () {
                            Share.share(quotesOfTheDay);
                          },
                          icon: const Icon(
                            Icons.share,
                            color: Colors.orange,
                          ),
                        )
                      ],
                    ),
                    Text(
                      quotesOfTheDay,
                      style: GoogleFonts.aBeeZee(
                        textStyle: const TextStyle(fontSize: 17),
                      ),
                    ),
                    const SizedBox(height: 30),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height,
                      ),
                      child: GridView.count(
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 1.0,
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          CustomHomeCard(
                            onTap: () {
                              Get.to(const EventScreen());
                            },
                            icon: Icons.event,
                            title: "Events",
                            subtitle: "List of events",
                          ),
                          CustomHomeCard(
                            onTap: () {
                              Get.to(const NewsScreen());
                            },
                            icon: Icons.newspaper,
                            title: "News",
                            subtitle: "Read church's news",
                          ),
                          CustomHomeCard(
                            image: "prayer.svg",
                            onTap: () {
                              Get.to(PrayersScreen());
                            },
                            title: "Prayers",
                            subtitle: "Read Prayers",
                          ),
                          // CustomHomeCard(
                          //   onTap: (){
                          //     Get.to(ProductFormPage());
                          //   },
                          //   icon: Icons.my_library_books_rounded,
                          //   title: "Inventory",
                          //   subtitle: "View inventory",
                          // ),
                          CustomHomeCard(
                            onTap: () {
                              Get.to(const GalleryScreen());
                            },
                            icon: Icons.image,
                            title: "Gallery",
                            subtitle: "Videos and Pictures",
                          ),
                          CustomHomeCard(
                            onTap: () {
                              Get.to(const LiveStreamingScreen());
                            },
                            icon: Icons.live_tv,
                            title: "Live Streaming",
                            subtitle: "Watch live",
                          ),
                          CustomHomeCard(
                            onTap: () {
                              Get.to(AboutScreen());
                            },
                            icon: Icons.church,
                            title: "About us",
                            subtitle: "Read about church",
                          ),
                          CustomHomeCard(
                            onTap: () {
                              Get.to(const ContactScreen());
                            },
                            icon: Icons.email,
                            title: "Contact",
                            subtitle: "Message to church",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
