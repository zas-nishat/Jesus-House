import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../Widgets/CustomAppBarDrawer.dart';
import '../Widgets/CustomBackgroundImage.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({super.key});

  String aboutChurch =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";

  // final String img =
  //     'https://t3.ftcdn.net/jpg/01/95/72/30/360_F_195723015_ola1OlHwWA1hzBmyjqEfx0sWctmUjopO.jpg';

  List<String> imageUrls = [
    'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0',
    'https://images.unsplash.com/photo-1517816743773-6e0fd518b4a6',
    'https://images.unsplash.com/photo-1518837695005-2083093ee35b',
    'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d',
    'https://images.unsplash.com/photo-1485217988980-11786ced9454',
    'https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05',
    'https://images.unsplash.com/photo-1506765515384-028b60a970df',
    'https://images.unsplash.com/photo-1501594907352-04cda38ebc29',
    'https://images.unsplash.com/photo-1483058712412-4245e9b90334',
    'https://images.unsplash.com/photo-1494783367193-149034c05e8f',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomBackgroundimage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text("About"),
          ),
          drawer: const CustomAppBarDrawer(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                      child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "About Jesus Home",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          aboutChurch,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 17),
                        ),
                      ],
                    ),
                  )),
                  Card(
                      child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Architecture",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          aboutChurch,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 17),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        ///Images
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: imageUrls.map((img) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(2),
                                  child: CachedNetworkImage(
                                    imageUrl: img.toString(),
                                    height: 150,
                                    fit: BoxFit.contain,
                                    placeholder: (context, url) => SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width * 0.3,
                                      height: MediaQuery.of(context).size.height *
                                          0.2,
                                      child: const Center(
                                          child: CircularProgressIndicator(
                                        color: Colors.orange,
                                      )),
                                    ),
                                    errorWidget: (context, url, error) {
                                      return Container(
                                        width: MediaQuery.of(context).size.width *
                                            0.3,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                        color: Colors.grey,
                                        child: const Center(
                                          child: Icon(
                                            Icons.error,
                                            color: Colors.red,
                                            size: 40.0,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  )),
                  Card(
                      child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Jesus Home History",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          aboutChurch,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 17),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
