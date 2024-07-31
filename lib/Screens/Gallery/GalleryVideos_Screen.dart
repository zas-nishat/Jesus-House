import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GalleryVideos_Screen extends StatelessWidget {
  GalleryVideos_Screen({super.key});

  final String img =
      'https://images.unsplash.com/photo-1438032005730-c779502df39b?q=80&w=1471&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

  /// make it list later
  final String ytLink = 'https://www.youtube.com/watch?v=O8nUJ831x2k';
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Uri url = Uri.parse(ytLink);
                        launchUrl(url, mode: LaunchMode.inAppBrowserView);
                      },
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: CachedNetworkImage(
                              imageUrl: img,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.25,
                              placeholder: (context, url) => SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                child: const Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.orange,
                                )),
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
                          Positioned.fill(
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              color: Colors.black.withOpacity(
                                  0.5), // Add a semi-transparent black background
                              child: const Icon(
                                Icons.play_circle_fill,
                                color: Colors.orange,
                                size: 45.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                      height: 8), // Add some space between the image and text
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
                    child: Text("5:02 mins"),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
