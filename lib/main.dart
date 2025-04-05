import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/core/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Im Mottu Mobile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.home,
      getPages: AppPages.routes,
    );
  }
}