import 'package:flutter/material.dart';
import 'package:mesh_gradient/mesh_gradient.dart';

class MeshButton extends StatelessWidget {
  const MeshButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AnimatedMeshGradient(
              colors: [Colors.red, Colors.blue, Colors.green, Colors.yellow],
              options: AnimatedMeshGradientOptions(),
            ),
          ),
        ),
      ),
    );
  }
}
