import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioDemo extends StatefulWidget {
  const DioDemo({super.key});

  @override
  State<DioDemo> createState() => _DioDemoState();
}

class _DioDemoState extends State<DioDemo> {
  List<dynamic> _data = [];
  final Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final url = "https://api.restful-api.dev/objects";

    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        setState(() {
          _data = response.data;
        });
      } else {
        log("Error: ${response.statusCode}");
      }
    } catch (e) {
      log("Exception: $e");
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API Data with Dio")),
      body:
          _data.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: _data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_data[index]["name"] ?? "No Name"),
                    subtitle: Text(_data[index]["id"] ?? "No ID"),
                  );
                },
              ),
    );
  }
}