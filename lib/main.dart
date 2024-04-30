import 'package:eroorhanler/firebase_options.dart';
import 'package:eroorhanler/views/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'consts/consts.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ///This widget is the root of your application///////////////////////////////.

  @override
  Widget build(BuildContext context) {

     /// using getx so we have to change this material app into getmaterialapp

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,

        ///to set appbar icon color/////////////////////////////////////////////

        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: darkFontGrey,
          ),
          backgroundColor: Colors.transparent),
          fontFamily:regular,
        ),
      home: const SplashScreen(),
      );
  }
}


