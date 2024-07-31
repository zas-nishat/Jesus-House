import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  List<String> churchImageUrls = [
    'https://images.unsplash.com/photo-1473177104440-ffee2f376098?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y2h1cmNofGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1548625149-fc4a29cf7092?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8Y2h1cmNofGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1491566102020-21838225c3c8?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGNodXJjaHxlbnwwfHwwfHx8MA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1663040392261-e12be32862c0?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGNodXJjaHxlbnwwfHwwfHx8MA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1677439907877-4eb43593775d?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjV8fGNodXJjaHxlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1571069424149-c456e0b413d6?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjd8fGNodXJjaHxlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1473177104440-ffee2f376098?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y2h1cmNofGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1548625149-fc4a29cf7092?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8Y2h1cmNofGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1491566102020-21838225c3c8?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGNodXJjaHxlbnwwfHwwfHx8MA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1663040392261-e12be32862c0?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGNodXJjaHxlbnwwfHwwfHx8MA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1677439907877-4eb43593775d?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjV8fGNodXJjaHxlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1571069424149-c456e0b413d6?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjd8fGNodXJjaHxlbnwwfHwwfHx8MA%3D%3D',
  ];

  final CarouselController _carouselController = CarouselController();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25, // Adjust the height to make it more like a banner
      child: CarouselSlider.builder(
        carouselController: _carouselController,
        itemCount: churchImageUrls.length,
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.25,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastLinearToSlowEaseIn,
          autoPlayAnimationDuration: const Duration(seconds: 2),
          viewportFraction: 1.0, // Adjusted to fill the width of the screen
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(5), // Remove border radius for a more banner-like look
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: churchImageUrls[index],
                fit: BoxFit.cover,
                placeholder: (context, url) => SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: const Center(
                    child: CircularProgressIndicator(color: Colors.orange),
                  ),
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
          );
        },
      ),
    );
  }
}
