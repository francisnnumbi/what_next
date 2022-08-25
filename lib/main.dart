import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:what_next/moduling.dart';

import 'dio_interceptor_handler.dart';

final Dio dio = DioInterceptorHandler.initDio();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'What Next',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: getModule(module: Modules.whatsapp),
    );
  }
}
