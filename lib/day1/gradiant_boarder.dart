import 'package:flutter/material.dart';

class GradientBorderExample extends StatelessWidget {
  const GradientBorderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds);
          },
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(width: 5, color: Colors.white),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                'Gradient Border',
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}