import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mpower/screens/Awareness.dart';
import 'package:mpower/screens/register.dart';
import 'screening.dart';
import 'views/health_workers.dart';
// import 'package:mpower/models/HealthWorkers.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Screening",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {
              var route = ModalRoute.of(context);
              if(route!=null){
                print(route.settings.name);
              }
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      barrierDismissible: true,
                      opaque: false,
                      pageBuilder:(_, anim1, anim2)=>ScreeningApp()));

          },
          ),
          DrawerListTile(
            title: "CHF Registration",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>Register())
              );
            },
          ),
          DrawerListTile(
            title: "Awareness & Education",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>AwarenessApp())
              );
            },
          ),
          DrawerListTile(
            title: "Notification",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Profile",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>Workers())
              );
            },
          ),
          DrawerListTile(
            title: "Settings",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
