import 'dart:ui';
import 'package:flutter/material.dart';

class FrostedGlassExample extends StatelessWidget {
  const FrostedGlassExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            'https://miro.medium.com/v2/resize:fit:503/1*ny9J-n57Ev3LhX8e58Okjg.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: 300,
                  height: 200,
                  // ignore: deprecated_member_use
                  color: Colors.white.withOpacity(0.3),
                  alignment: Alignment.center,
                  child: Text(
                    'Frosted Glass Effect',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
