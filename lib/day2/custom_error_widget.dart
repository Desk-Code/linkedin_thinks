import 'package:flutter/material.dart';

class CustomFlutterErrorWidget extends StatelessWidget {
  const CustomFlutterErrorWidget({super.key});

  /* This code implimention on material page (main app)
builder: (context, child) {
  ErrorWidget.builder = (errorDetails) {
    return const CustomFlutterErrorWidget();
  };
  return child!;
},
*/

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Image(image: AssetImage("assets/error_image.png"), height: 100.0),
          SizedBox(height: 20.0),
          Text(
            "An error occurred. Please try again later",
            style: TextStyle(fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}
