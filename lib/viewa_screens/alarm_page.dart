import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 32,vertical: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            "Alarm".text.white.bold.size(24).make(),
            "Alarm".text.white.bold.size(24).make(),
            "Alarm".text.white.bold.size(24).make(),
            "Alarm".text.white.bold.size(24).make(),
            "Alarm".text.white.bold.size(24).make(),
      

          ],
        ),
      ),
    );
  }
}
