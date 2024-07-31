import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GalleryPictures_Screen extends StatelessWidget {
  GalleryPictures_Screen({super.key});

  final String img = 'https://t3.ftcdn.net/jpg/01/95/72/30/360_F_195723015_ola1OlHwWA1hzBmyjqEfx0sWctmUjopO.jpg';

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height*0.3, // Set your desired height here
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                      child: CachedNetworkImage(
                        imageUrl:
                          img,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.25,
                        placeholder: (context, url) => SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: const Center(child: CircularProgressIndicator(color: Colors.orange,)),
                        ),
                          errorWidget: (context, url, error) {
                            return Container(
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
                  ),
                  const SizedBox(height: 8), // Add some space between the image and text
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Church Architecture",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("120 Pictures"),
                  ),
                  const SizedBox(height: 10,)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
