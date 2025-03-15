import 'package:flutter/material.dart';

class RepaintBoundaryExample extends StatelessWidget {
  const RepaintBoundaryExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RepaintBoundary(
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
            child: Center(child: Text('Optimized')), // Avoid unnecessary repaints
          ),
        ),
      ),
    );
  }
}