Implementing Background Services & Push Notifications in Flutter

Flutter apps often require background services and push notifications to keep users engaged. Whether it’s sending real-time updates, handling background tasks, or triggering scheduled notifications, implementing these features effectively is crucial.

In this guide, we’ll cover:
✅ Background Services — Running tasks when the app is minimized or closed
✅ Push Notifications — Sending messages via Firebase Cloud Messaging (FCM)

1️⃣ Setting Up Background Services in Flutter
📌 Why Use Background Services?
Background tasks allow your app to:
✔ Perform background data sync (fetching updates)
✔ Track user location in the background
✔ Process scheduled tasks when the app is closed

🔹 Using the flutter_background_service Package

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeService();
  runApp(MyApp());
}

Future<void> initializeService() async {
  final service = FlutterBackgroundService();

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: true,
      isForegroundMode: true,
    ),
    iosConfiguration: IosConfiguration(
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
  );

  service.startService();
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) {
  if (service is AndroidServiceInstance) {
    service.setAsForegroundService();
  }

  Timer.periodic(Duration(seconds: 10), (timer) async {
    bool isOnline = await checkInternet();
    print('Internet Status: ${isOnline ? "Connected" : "Disconnected"}');
  });
}

Future<bool> checkInternet() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.none) {
    return false;
  }
  try {
    final result = await InternetAddress.lookup('google.com');
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } catch (e) {
    return false;
  }
}

@pragma('vm:entry-point')
bool onIosBackground(ServiceInstance service) {
  return true;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Background Internet Check")),
        body: Center(child: Text("App Running")),
      ),
    );
  }
}
