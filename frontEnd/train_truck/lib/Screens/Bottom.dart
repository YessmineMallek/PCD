import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:train_truck/Screens/Notifications/NotificationPage.dart';
import 'package:train_truck/Screens/reclamation/ReclamationPage.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({super.key});

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  static List<Widget> pages = [];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    var primaryColor=Theme.of(context).primaryColor;

    pages = <Widget>[
      ReclamationPage(),
      ReclamationPage(),
      ReclamationPage(),
      NotificationPage()

    ];
    return Scaffold(
      body: pages.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
          items:[
            BottomNavigationBarItem(
                label: 'Map',
                icon: IconButton(
                  icon: SvgPicture.asset(
                    "assets/images/mapIcon.svg",
                    height: 35,
                    width: 35,
                    color:currentIndex==0? primaryColor:Colors.grey,

                  ),
                  onPressed: null,
                )),
            BottomNavigationBarItem(
                label: 'Bus',
                icon: IconButton(
                  icon: SvgPicture.asset(
                    "assets/images/busIcon.svg",
                    height: 35,
                    width: 35,
                    color:currentIndex==1? primaryColor:Colors.grey,

                  ),
                  onPressed: null,
                )),
            BottomNavigationBarItem(
                label: 'reclamation',
                icon: IconButton(
                  icon: SvgPicture.asset(
                    "assets/images/iconReclamation.svg",
                    height: 35,
                    width: 35,
                    color:currentIndex==2? primaryColor:Colors.grey,

                  ),
                  onPressed: null,
                )),
            BottomNavigationBarItem(
                  label: 'Profile',
                icon: IconButton(
                  icon: SvgPicture.asset(
                    "assets/images/iconProfile.svg",
                    height: 100,
                    color:currentIndex==3? primaryColor:Colors.grey,
                  ),
                  onPressed: null,
                )),
          ]
      ),
    );
  }
}
