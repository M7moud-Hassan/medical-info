import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:info_teby/Pages/Home.dart';
import 'package:info_teby/controller/MyController.dart';

import 'Pages/Favorite.dart';
import 'controller/MyBinding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    getPages: [
      GetPage(name: '/home', page: () => (Home()), binding: MyBinding()),
      GetPage(
          name: '/favorite', page: () => (Favorite()), binding: MyBinding()),
    ],
    initialRoute: '/home',
    defaultTransition: Transition.native,
    title: 'معلومات طبية',
  ));
}
