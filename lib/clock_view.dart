import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({super.key});

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  // @override
  // void initState() {
  //   Timer.periodic(Duration(seconds: 1), (timer) {
  //
  //     if (!mounted) {
  //       timer.cancel();
  //     } else {
  //       setState(() {});
  //     }
  //   }
  //
  //   );
  //   super.initState();
  // }

  late var timer;
  void initState() {
// TODO: implement initState
    super.initState();
    if (mounted) {

      timer = new Timer.periodic(Duration(seconds: 1), (Timer t) => setState(() {}));

    }
  }


  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi /2,

      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: 210,
          height: 210,
          child: CustomPaint(
            painter: ClockPainter(),
          ),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter{

  var dateTime = DateTime.now();
  //60 sec - 360, 1 sec - 6 digree

  @override
  void paint(Canvas canvas, Size size) {
  var centerX = size.width/2;
  var centerY = size.height/2;
  var center = Offset(centerX, centerY);

  var radius = min(centerX, centerY);

  var fillBrush = Paint()
  ..color = Color(0xFF444974);


  var outlineBrush = Paint()
    ..color = Color(0xFFEAECFF)
  ..style = PaintingStyle.stroke
  ..strokeWidth = size.width / 25;


  var centerDotBrush = Paint()
    ..color = Color(0xFFEAECFF);

  var secHandBrush = Paint()
    ..color = Colors.orange.shade300
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = size.width / 70;

  var minHandBrush = Paint()
    ..shader = RadialGradient(colors: [Color(0xFF748EF6),Color(0XFF77DDFF)])
        .createShader(Rect.fromCircle(center: center, radius: radius))
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = size.width / 35;

  var hourHandBrush = Paint()
    ..shader = RadialGradient(colors: [Color(0XFFEA74AB),Color(0XFFC279FB)])
        .createShader(Rect.fromCircle(center: center, radius: radius))
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = size.width / 30;

  var dashHandBrush = Paint()
    ..color = Colors.white
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1;



  canvas.drawCircle(center, radius * 0.70, fillBrush);
  canvas.drawCircle(center, radius * 0.70, outlineBrush);

  var hourHandX = centerX + radius * 0.4 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
  var hourHandY = centerY + radius * 0.4 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
  canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

  var minHandX = centerX + radius * 0.6 * cos(dateTime.minute * 6 * pi / 180);
  var minHandY = centerY + radius * 0.6 * sin(dateTime.minute * 6 * pi / 180);
  canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

  var secHandX = centerX + radius * 0.6 * cos(dateTime.second * 6 * pi / 180);
  var secHandY = centerY + radius * 0.6 * sin(dateTime.second * 6 * pi / 180);
  canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

  canvas.drawCircle(center, radius * 0.12, centerDotBrush);

  var outerRadius = radius;
  var innerRadius = radius * 0.9;

  for (double i = 0; i <360; i += 12){

    var x1 = centerX + outerRadius * cos(i * pi/180);
    var y1 = centerX + outerRadius * sin(i * pi/180);


    var x2 = centerX + innerRadius * cos(i * pi/180);
    var y2 = centerX + innerRadius * sin(i * pi/180);

canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashHandBrush);

  }



  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
   return true;
  }

}


