import 'dart:convert';

import 'package:city_church_app/Models/GetDataFunction.dart';
import 'package:city_church_app/Screens/Prayers/PrayersDetails_Screen.dart';
import 'package:city_church_app/Widgets/CustomBackgroundImage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../Models/JModels.dart';
import '../../Widgets/CustomAppBarDrawer.dart';
import 'PrayersContentCard.dart';

class PrayersScreen extends StatelessWidget {
  PrayersScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomBackgroundimage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text("Prayers"),
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
                final prayerData = snapshot.data!;
                return PrayersContentCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrayersdetailsScreen(
                          prayers: prayerData.prayers ?? [],
                        ),
                      ),
                    );
                  },
                  prayers: prayerData.prayers ?? [],
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
