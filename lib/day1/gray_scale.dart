import 'package:flutter/material.dart';

class GrayscaleExample extends StatelessWidget {
  const GrayscaleExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColorFiltered(
        colorFilter: const ColorFilter.mode(
          Colors.grey,
          BlendMode.saturation,
        ),
        child: Center(
          child: Image.network('https://miro.medium.com/v2/resize:fit:503/1*ny9J-n57Ev3LhX8e58Okjg.png'),
        ),
      ),
    );
  }
}