import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkedin_thinks/day2/custom_error_widget.dart';
import 'package:linkedin_thinks/day5/dio_demo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await initializeService();
  runApp(const MyApp());
}

// Future<void> initializeService() async {
//   final service = FlutterBackgroundService();

//   await service.configure(
//     androidConfiguration: AndroidConfiguration(
//       onStart: onStart,
//       autoStart: true,
//       isForegroundMode: true,
//     ),
//     iosConfiguration: IosConfiguration(
//       onForeground: onStart,
//       onBackground: onIosBackground,
//     ),
//   );

//   service.startService();
// }

// @pragma('vm:entry-point')
// void onStart(ServiceInstance service) {
//   if (service is AndroidServiceInstance) {
//     service.setAsForegroundService();
//   }

//   Timer.periodic(Duration(seconds: 10), (timer) async {
//     bool isOnline = await checkInternet();
//     log('Internet Status: ${isOnline ? "Connected" : "Disconnected"}');
//   });
// }

// Future<bool> checkInternet() async {
//   var connectivityResult = await Connectivity().checkConnectivity();
//   if (connectivityResult == ConnectivityResult.none) {
//     return false;
//   }
//   try {
//     final result = await InternetAddress.lookup('google.com');
//     return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
//   } catch (e) {
//     return false;
//   }
// }

// @pragma('vm:entry-point')
// bool onIosBackground(ServiceInstance service) {
//   return true;
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
