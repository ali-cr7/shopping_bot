import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shopping_bot/constants.dart';
import 'package:shopping_bot/feauters/views/search_page.dart';
import 'package:shopping_bot/feauters/views/splash_view.dart';
import 'package:shopping_bot/feauters/views/home_page.dart';

void main() {
  runApp(   
     GetMaterialApp(

     debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      builder: EasyLoading.init(),
         defaultTransition: Transition.circularReveal,
           getPages: [
      GetPage(name: '/splash', page: () => SplashView()),
      GetPage(
          name: '/home', page: () => HomePage(books: [],)),
      GetPage(
          name: '/search', page: () => SearchPage()),
           ],
   theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
      ),
        

  ) );
}