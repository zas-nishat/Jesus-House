import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../Widgets/CustomBackgroundImage.dart';

class NewsdetailsScreen extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;
  final String heading;
  final String description;
  const NewsdetailsScreen({super.key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.heading,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomBackgroundimage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            },
                icon: const Icon(Icons.arrow_back_ios)),
            backgroundColor: Colors.transparent,
            title: const Text("News details"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0), // You can adjust the radius as needed
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl:
                          imageUrl,
                          fit: BoxFit.cover,
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
                                  size: 50.0,
                                ),
                              ),
                            );
                          },

                      ),
                    ),
                  ),

                  const SizedBox(height: 20,),
                  Text(
                    heading,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: Text(title)),
                                Text(date)
                              ],
                            ),
                          ),
                          Text( description,
                          style: const TextStyle(
                            fontSize: 17
                          ),),
                        ],
                      ),
                    ),
                  )



                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
