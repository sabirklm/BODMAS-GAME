import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCzb6YFVoyfQ60FfRKCWY7ai7y0iTKTnbY",
      appId: "1:572194537793:web:447169984265a29e4621c0",
      messagingSenderId: "572194537793",
      projectId: "insion",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);
  const MyApp({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BODMAS',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const HomePage(),
    );
  }
}
