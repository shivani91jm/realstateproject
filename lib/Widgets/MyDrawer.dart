import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realstateproject/MutipleProvidersss/BottomNavigationBarProvider.dart';
class MydrawerClass extends StatelessWidget {
  const MydrawerClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationBarProvider>(
        builder: (context, drawerProvider, child) {
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text('Drawer Header'),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
                ListTile(
                  title: Text('Home'),
                  selected: drawerProvider.selectedIndex == 0,
                  onTap: () {
                    drawerProvider.setselectedIndex(0);
                    Provider.of<BottomNavigationBarProvider>(
                        context, listen: false).setselectedIndex(0);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('About Us'),
                  selected: drawerProvider.selectedIndex == 1,
                  onTap: () {
                    drawerProvider.setselectedIndex(1);
                    Provider.of<BottomNavigationBarProvider>(
                        context, listen: false)
                        .setselectedIndex(1);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Property'),
                  selected: drawerProvider.selectedIndex == 2,
                  onTap: () {
                    drawerProvider.setselectedIndex(2);
                    Provider.of<BottomNavigationBarProvider>(
                        context, listen: false)
                        .setselectedIndex(1);
                    Navigator.pop(context);
                  },
                ),

              ],
            ),
          );
        });
  }
}
