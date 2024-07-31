import 'dart:convert';
import 'package:city_church_app/Models/GetDataFunction.dart';
import 'package:city_church_app/Models/JModels.dart';
import 'package:city_church_app/Widgets/CustomAppBarDrawer.dart';
import 'package:city_church_app/Widgets/CustomBackgroundImage.dart';
import 'package:flutter/material.dart';
import 'Past_Events.dart';
import 'Upcoming_Events.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final List<String> _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  String? _selectedMonth;

  List<Incoming> _filterEventsByMonth(List<Incoming> events, String month) {
    final monthIndex = _months.indexOf(month) + 1;
    return events.where((event) {
      final eventDate = DateTime.parse(event.date!); // Assuming event.date is a string in "yyyy-MM-dd" format
      return eventDate.month == monthIndex;
    }).toList();
  }

  List<Past> _filterPastEventsByMonth(List<Past> events, String month) {
    final monthIndex = _months.indexOf(month) + 1;
    return events.where((event) {
      final eventDate = DateTime.parse(event.date!); // Assuming event.date is a string in "yyyy-MM-dd" format
      return eventDate.month == monthIndex;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomBackgroundimage(),
        DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: const Text("Events"),
              actions: [
                DropdownButton(
                  hint: const Text('Select a month',
                      style: TextStyle(color: Colors.white)),
                  value: _selectedMonth,
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedMonth = newValue!;
                    });
                  },
                  items: _months.map<DropdownMenuItem<String>>((String month) {
                    return DropdownMenuItem(
                      value: month,
                      child: Text(month),
                    );
                  }).toList(),
                ),
              ],
              bottom: const TabBar(
                tabs: [
                  Tab(text: "Upcoming"),
                  Tab(text: "Past"),
                ],
              ),
            ),
            drawer: const CustomAppBarDrawer(),
            body: FutureBuilder<JModels>(
              future: getAllData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return const Center(child: Text('No data available'));
                } else {
                  final eventsData = snapshot.data!;
                  final upcomingEvents = _selectedMonth != null
                      ? _filterEventsByMonth(eventsData.events?.incoming ?? [], _selectedMonth!)
                      : eventsData.events?.incoming ?? [];
                  final pastEvents = _selectedMonth != null
                      ? _filterPastEventsByMonth(eventsData.events?.past ?? [], _selectedMonth!)
                      : eventsData.events?.past ?? [];

                  return TabBarView(
                    children: [
                      upcomingEvents.isNotEmpty
                          ? UpcomingEvents(events: upcomingEvents)
                          : const Center(child: Text('No events on this month')),
                      pastEvents.isNotEmpty
                          ? PastEvents(events: pastEvents)
                          : const Center(child: Text('No events on this month')),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
