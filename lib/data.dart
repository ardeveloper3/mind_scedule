import 'package:mind_scedule/enums.dart';
import 'package:mind_scedule/models/alarm_info.dart';
import 'package:mind_scedule/models/menu_info.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock,title: "Clock",imageSource: "assets/images/clock_icon.png"),
  MenuInfo(MenuType.alarm,title: "Alarm",imageSource: "assets/images/alarm_icon.png"),
  MenuInfo(MenuType.timer,title: "Timer",imageSource: "assets/images/timer_icon.png"),
  MenuInfo(MenuType.stopWatch,title: "StopWatch",imageSource: "assets/images/stopwatch_icon.png"),

];

List<AlarmInfo> alarms = [

  AlarmInfo(DateTime.now().add(Duration(hours: 1)),description: "office"),

];
