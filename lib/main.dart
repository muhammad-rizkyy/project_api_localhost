import 'package:flutter/material.dart';
import 'package:localhost_api/screen/biodata_create.dart';
import 'package:localhost_api/screen/biodata_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project Biodata',
      initialRoute: BiodataList.routeName,
      routes: {
        BiodataList.routeName: (context) => const BiodataList(),
        BiodataCreate.routeName: (context) => const BiodataCreate(),
      },
    );
  }
}
