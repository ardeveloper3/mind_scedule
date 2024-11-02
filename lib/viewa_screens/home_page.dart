import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mind_scedule/clock_view.dart';
import 'package:mind_scedule/common_widgets/common_widgets.dart';
import 'package:mind_scedule/data.dart';
import 'package:mind_scedule/enums.dart';
import 'package:mind_scedule/models/menu_info.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
var formatetedTime = DateFormat('HH:mm').format(now);
    var formatetedDate = DateFormat('EEE, d MMM').format(now);
    var timeZoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if(!timeZoneString.startsWith('-')) offsetSign = '+';

    return Scaffold(
      
      body: SafeArea(
        child: Row(
          children: [
            Container(
              width: 80,
              color:Color(0xFF2D2F41),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: menuItems.map((currentMenuInfo) => buildMenuItem(currentMenuInfo)).toList()
              ),
            ),
        
        VerticalDivider(
          color: Colors.grey.withOpacity(0.1),
          width: 0.2,
        ),
        
        
            Expanded(
              child: Consumer<MenuInfo>(
                builder: (BuildContext context, MenuInfo value, Widget? child) {

                  if(value.menuType != MenuType.clock) return Container();

                   return Container(
                    padding: EdgeInsets.symmetric(horizontal: 32,vertical: 64),
                    color: Color(0xFF2D2F41),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Clock".text.bold.fontFamily("avenir").white.size(24).make(),
                        10.heightBox,
                        formatetedTime.text.bold.white.size(64).make(),
                        formatetedDate.text.white.size(20).make(),
                        30.heightBox,

                        ClockView(),
                        20.heightBox,

                        "TimeZone".text.bold.fontFamily("avenir").white.size(24).make(),

                        16.widthBox,

                        Row(
                          children: [
                            Icon(Icons.language,color: Colors.white,),
                            16.widthBox,

                            "UTC+ $offsetSign +$timeZoneString".text.fontFamily("avenir").white.size(20).make(),

                          ],
                        )

                      ],
                    ),
                  );
                },

              ),
            ),
          ],
        ),
      ),
    );
  }
}




Widget buildMenuItem(MenuInfo currentMenuInfo,{onTap,context}){
  return    Consumer<MenuInfo>(
    builder: (BuildContext context, MenuInfo value, Widget? child) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Container(
           width: 80,
            padding: EdgeInsets.symmetric(horizontal: 0,vertical: 16.0),

            color: currentMenuInfo.menuType == value.menuType? Colors.black12:Colors.transparent,

            child: Column(
              children: [

                Image.asset("${currentMenuInfo.imageSource}",scale: 1.5,),
                16.heightBox,
                "${currentMenuInfo.title}".text.fontFamily('avenir').white.size(14).make(),
              ],
            )
        ).onTap((){
          var menuInfo = Provider.of<MenuInfo>(context,listen: false);
          menuInfo.updateMenu(currentMenuInfo);
        }),
      );
    },

  );
}
