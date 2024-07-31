import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/CustomAppBarDrawer.dart';
import '../Widgets/CustomBackgroundImage.dart';

class LiveStreamingScreen extends StatelessWidget {
  const LiveStreamingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomBackgroundimage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text("Live Stream"),
            actions: [
              // PopupMenuButton(
              //   itemBuilder: (context) => [
              //     const PopupMenuItem(
              //       value: 0,
              //       child: Text('Catholic Church'),
              //     ),
              //     const PopupMenuItem(
              //       value: 1,
              //       child: Text('Historic Church'),
              //     ),
              //   ],
              // )
            ],
          ),
          drawer: const CustomAppBarDrawer(),
          body: const Center(
            child: Text("Functions will be here",style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
            ),),
          ),
        ),
      ],
    );
  }
}
