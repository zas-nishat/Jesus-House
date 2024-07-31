import 'package:city_church_app/Models/GetDataFunction.dart';
import 'package:city_church_app/Widgets/CustomBackgroundImage.dart';
import 'package:flutter/material.dart';
import '../../Widgets/CustomAppBarDrawer.dart';
import 'NewsContentCard.dart';
import 'NewsDetails_Screen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomBackgroundimage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text("News"),
          ),
          drawer: const CustomAppBarDrawer(),
          body: FutureBuilder(
            future: getAllData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Something went wrong}'));
              } else if (!snapshot.hasData) {
                return const Center(child: Text('No data available'));
              } else {
                final newsData = snapshot.data!;
                return NewsContentCard(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => NewsdetailsScreen(
                    //       imageUrl: newsItem['imageUrl'] ?? '',
                    //       title: newsItem['title'] ?? '',
                    //       date: newsItem['date'] ?? '',
                    //       heading: newsItem['heading'] ?? '',
                    //       description: newsItem['description'] ?? '',
                    //     ),
                    //   ),
                    // );
                  },
                  newsData: newsData.news ?? [],

                );
              }
            },
          ),
        ),
      ],
    );
  }
}
