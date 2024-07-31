import 'package:flutter/material.dart';
import 'package:city_church_app/Models/JModels.dart';

class PastEvents extends StatelessWidget {
  final List<Past> events;

  const PastEvents({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (BuildContext context, int index) {
        final event = events[index];
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Date, time and age container
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.date_range, color: Colors.orange),
                      Text(event.date ?? ""),
                      const Icon(Icons.timer, color: Colors.orange),
                      Text(event.time ?? ""), // Placeholder time
                      Icon(Icons.person, color: Colors.orange),
                      Text(event.ages ?? ""), // Placeholder age
                    ],
                  ),
                ),
              ),

              /// Event info
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(event.name ?? "",style: TextStyle(
                          fontSize: 16
                      ),),

                      Text(
                        event.title ?? "",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(event.description ?? "",style: TextStyle(
                          fontSize: 16
                      ),),
                      const SizedBox(height: 10),
                      Text("More: ${event.additionalData ?? " "}",style: TextStyle(
                          fontSize: 16
                      ),)
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
