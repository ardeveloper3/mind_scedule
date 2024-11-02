import 'package:flutter/material.dart';
import 'package:mind_scedule/viewa_screens//home_page.dart';
import 'package:mind_scedule/enums.dart';
import 'package:mind_scedule/models/menu_info.dart';
import 'package:mind_scedule/tts.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Color(0xFF2D2F41)));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF2D2F41),

      primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
     home: ChangeNotifierProvider<MenuInfo>(
       create: (context)=> MenuInfo( MenuType.clock),
     child: HomePage(),),
    );
  }
}


