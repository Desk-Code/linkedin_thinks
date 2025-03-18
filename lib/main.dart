import 'package:flutter/material.dart';
import 'package:linkedin_thinks/day2/custom_error_widget.dart';
import 'package:linkedin_thinks/day5/dio_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // Add the created custom error screen to the MaterialApp builder method:
      builder: (context, child) {
        ErrorWidget.builder = (errorDetails) {
          return const CustomFlutterErrorWidget();
        };
        return child!;
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: DioDemo(),
    );
  }
}
