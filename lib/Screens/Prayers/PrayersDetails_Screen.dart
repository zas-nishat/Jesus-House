import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../Models/JModels.dart';
import '../../Widgets/CustomBackgroundImage.dart';

class PrayersdetailsScreen extends StatelessWidget {
  final List<Prayers> prayers;

  const PrayersdetailsScreen({super.key, required this.prayers});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomBackgroundimage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            backgroundColor: Colors.transparent,
            title: const Text("Prayer Details"),
          ),
          body: ListView.builder(
            itemCount: prayers.length,
            itemBuilder: (context, index) {
              final prayer = prayers[index];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  color: Colors.grey.shade900,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          prayer.details.toString(),
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          prayer.details.toString(),
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Ameen",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
