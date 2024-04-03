import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double? heading = 0;

  @override
  void initState() {
    super.initState();

    FlutterCompass.events!.listen((event) {
      setState(() {
        heading = event.heading;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        centerTitle: true,
        title: const Text('The Compass'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${heading!.ceil()}°',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/cadrant.png',
                ),
                Transform.rotate(
                  angle: ((heading??0) * (pi / 180) * -1),
                  child: Image.asset(
                    'assets/images/compass.png',
                    // scale: 1.1,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
