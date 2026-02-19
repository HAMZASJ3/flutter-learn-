import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/drawer_screen.dart';
import 'package:project/screens/first_screen.dart';
import 'package:project/screens/grid_view_builder_screen.dart';
import 'package:project/screens/home_screen.dart';
import 'package:project/screens/image.dart';
import 'package:project/screens/list_view_builder_screen.dart';
import 'package:project/screens/list_view_screen.dart';
import 'package:project/screens/login_screen.dart';
import 'package:project/screens/splash.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo H',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: Splash(),

    );
  }
}

